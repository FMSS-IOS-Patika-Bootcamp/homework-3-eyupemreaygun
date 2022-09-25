//
//  ToDoAddViewController.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 20.09.2022.
//

import UIKit

class ToDoAddViewController: UIViewController {
    @IBOutlet weak var subjTF: UITextField!
    @IBOutlet weak var toDoTF: UITextField!
    
    var addViewModelNesnesi:ViewToViewModelAddProtocol?
    var list: ToDoModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ToDoAddBuilder.createModule(ref: self)
        if let l = list {
            subjTF.text = l.subj_todo
            toDoTF.text = l.work_todo
        }

    }
    
    @IBAction func addToBtn(_ sender: Any) {
        if let sb = subjTF.text , let td = toDoTF.text {
            addViewModelNesnesi?.add(work_todo: sb, subj_todo: td)
            
        }
}
}
