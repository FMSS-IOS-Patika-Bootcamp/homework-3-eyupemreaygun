//
//  ToDoViewModel.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 24.09.2022.
//

import Foundation

class ToDoViewModel : ViewToViewModelAddProtocol {
    var ToDoAddModel: ViewModelToModelAddProtocol?
    
    func add(work_todo: String, subj_todo: String) {
        ToDoAddModel?.add(work_todo: work_todo, subj_todo: subj_todo)
 
        
        
    }
}
