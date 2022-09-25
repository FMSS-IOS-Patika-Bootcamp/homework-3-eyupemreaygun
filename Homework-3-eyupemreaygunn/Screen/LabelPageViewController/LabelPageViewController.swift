//
//  ViewController.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 20.09.2022.
//

import UIKit

class LabelPageViewController: UIViewController {

    @IBOutlet weak var labelPageTableView: UITableView!
    
    private let viewModel = LabelPageViewModel()
    private var items: [PostCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        labelPageTableView.delegate = self
        labelPageTableView.dataSource = self
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        registerCell()
        

        }
    
}
extension LabelPageViewController: LabelPageViewModelViewProtocol {
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.labelPageTableView.reloadData()
        }
        
   
    }
    func showEmptyView() {
        
    }
    func hideEmptyView() {
        
    }
    func registerCell() {
        labelPageTableView.register(UINib(nibName: "LabelPageTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
}
extension LabelPageViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = labelPageTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?
        LabelPageTableViewCell
        
        cell?.labelPageLbl.text = items[indexPath.row].title

        cell?.bodyLbl.text = items[indexPath.row].body
        cell?.idLbl.text = String(items[indexPath.row].id ?? 0)
        cell?.userIdLbl.text = String(items[indexPath.row].userId ?? 0)
        


        return cell!
    }
}

