//
//  ToDoListViewController.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 20.09.2022.
//

import UIKit
import CoreData

protocol DetayVCToViewControllerProtocol {
    func veriGonder(mesaj:Bool)
}

class ToDoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var list = [ToDoModel]()
    var viewModelNesnesi: ViewToViewModelProtocol?
    var customThick : Bool?
    var delegate: DetayVCToViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
        ToDoListBuilder.createModule(ref: self)
        

    }
    override func viewWillAppear(_ animated: Bool) {
       viewModelNesnesi?.uploadNotes()
        list.reverse()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let list = sender as? ToDoModel {
                let gidilecekVC = segue.destination as! ToDoDetailViewController
                gidilecekVC.list = list

            }
        }
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
}
extension ToDoListViewController:   ViewModelToViewProtocol {
    func vieweVeriGonder(toDoList: Array<ToDoModel>) {
        self.list = toDoList
        self.tableView.reloadData()
    }
    }
extension ToDoListViewController : DetayVCToViewControllerDelegate {
    func veriGonder(mesaj: Bool) {
        if mesaj == true {
            customThick = true

        } else {
            customThick = false
        }
      
    }
    
}
extension ToDoListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = list[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
       
        
        cell.toDoLbl.text = "\(list.work_todo!)"
        if customThick == true && (indexPath.row != 0) {
        cell.selectedThick.image = UIImage(systemName: "checkmark.seal.fill")
            print(customThick!)
        }
        else {
            cell.selectedThick.image = UIImage(systemName: "checkmark.seal")
        }
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = list[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: list)
        tableView.deselectRow(at: indexPath, animated: true)
        
 }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastVisibleIndexPath = tableView.indexPathsForVisibleRows?.last {
                if indexPath == lastVisibleIndexPath {
                    // do here...
                }
   
    }
}
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let list = self.list[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(list.work_todo!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.viewModelNesnesi?.delete(list: list)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    }
    

