//
//  Protocol.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 23.09.2022.
//

import Foundation

protocol ViewToViewModelProtocol {
    var toDoListModel:ViewModelToModelProtocol? {get set}
    var toDoListVC:ViewModelToViewProtocol? {get set}
    
    func uploadNotes()
   
    func delete(list:ToDoModel)
}

protocol ViewModelToModelProtocol {
    var toDoListViewModel:ModelToViewModelProtocol? {get set}
    
    func allNotes()
    
    func delete(list:ToDoModel)
}

protocol ModelToViewModelProtocol {
    func ViewModelaVeriGonder(toDoList:Array<ToDoModel>)
}

protocol ViewModelToViewProtocol {
    func vieweVeriGonder(toDoList:Array<ToDoModel>)
}

protocol ViewToRouterProtocol {
    static func createModule(ref:ToDoListViewController)
}
