//
//  ToDoLisViewModal.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 23.09.2022.
//

import Foundation

class ToDoListViewModel : ViewToViewModelProtocol {
    var toDoListModel: ViewModelToModelProtocol?
    var toDoListVC: ViewModelToViewProtocol?
    
    func uploadNotes() {
        toDoListModel?.allNotes()
    }
    
    func delete(list: ToDoModel) {
        toDoListModel?.delete(list: list)
    }
    }
extension ToDoListViewModel : ModelToViewModelProtocol {
    func ViewModelaVeriGonder(toDoList: Array<ToDoModel>) {
        toDoListVC?.vieweVeriGonder(toDoList: toDoList)
    }
    
    
}
