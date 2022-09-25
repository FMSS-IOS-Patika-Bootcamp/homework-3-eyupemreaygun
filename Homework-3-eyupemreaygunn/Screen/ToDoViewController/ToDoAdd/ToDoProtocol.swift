//
//  Protocol.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 24.09.2022.
//

import Foundation

protocol ViewToViewModelAddProtocol {
    var ToDoAddModel: ViewModelToModelAddProtocol? {get set}
    
    
    func add(work_todo:String,subj_todo:String)
    
}
protocol ViewModelToModelAddProtocol {
    func add(work_todo:String,subj_todo:String)
    
}
protocol ViewModelToRouterAddProtocol {
    static func createModule(ref:ToDoAddViewController)
    
}
