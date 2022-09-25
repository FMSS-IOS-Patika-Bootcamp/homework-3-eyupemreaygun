//
//  ToDoDetailProtocol.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 24.09.2022.
//

import Foundation

protocol ViewToViewModelDetailProtocol {
    var detailModel : ViewModelToModelDetailProtocol? {get set}
    
    func edit(list:ToDoModel,subj_todo:String,work_todo:String)
    
}
protocol ViewModelToModelDetailProtocol {
    func perEdit(list:ToDoModel,subj_todo:String,work_todo:String)
}
protocol ViewModelToRouterDetailProtocol {
    static func createModule(ref:ToDoDetailViewController)
    
}
