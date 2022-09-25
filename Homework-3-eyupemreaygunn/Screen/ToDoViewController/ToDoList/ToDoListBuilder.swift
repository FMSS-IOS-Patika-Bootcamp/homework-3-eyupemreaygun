//
//  Router.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 24.09.2022.
//

import Foundation

class ToDoListBuilder : ViewToRouterProtocol {
    static func createModule(ref: ToDoListViewController) {
        let viewModel = ToDoListViewModel()
        
        //View
        ref.viewModelNesnesi = viewModel
        
        //ViewModel
        ref.viewModelNesnesi?.toDoListModel = ToDoListModel()
        ref.viewModelNesnesi?.toDoListVC  = ref
        
        
        //Model
        ref.viewModelNesnesi?.toDoListModel?.toDoListViewModel = viewModel
    }
}
