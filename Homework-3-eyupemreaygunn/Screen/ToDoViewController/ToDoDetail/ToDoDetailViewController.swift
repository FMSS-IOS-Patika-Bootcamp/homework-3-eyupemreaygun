//
//  ToDoDetailViewController.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 20.09.2022.
//

import UIKit
protocol DetayVCToViewControllerDelegate: AnyObject {
    func veriGonder(mesaj:Bool)
    
}



class ToDoDetailViewController: UIViewController {
    var delegate: DetayVCToViewControllerProtocol?

    @IBOutlet weak var subjTF: UITextField!
    @IBOutlet weak var workTF: UITextField!
    var list : ToDoModel?
    
    var detailViewModelNesnesi: ViewToViewModelDetailProtocol?
    var changeTick : Bool?
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ToDoDetailBuilder.createModule(ref: self)
        
        if let l = list {
            subjTF.text = l.subj_todo
            workTF.text = l.work_todo
            
            
            }
        

    }
    @IBAction func changeThickBtn(_ sender: Any) {
        changeTick = true
        if let mesaj = changeTick {
            delegate?.veriGonder(mesaj: mesaj)
        }
    }
    @IBAction func makeAsCompleteBtn(_ sender: Any) {
        if let st = subjTF.text , let wt = workTF.text , let l = list {
            detailViewModelNesnesi?.edit(list: l,subj_todo: st,work_todo: wt)
            
        }
        
    }

    
    
}

