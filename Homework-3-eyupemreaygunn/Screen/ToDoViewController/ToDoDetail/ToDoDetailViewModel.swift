//
//  ToDoDetailViewModel.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 24.09.2022.
//

import Foundation

class ToDoDetailViewModel : ViewToViewModelDetailProtocol {
    var detailModel: ViewModelToModelDetailProtocol?
    
    
    func edit(list: ToDoModel, subj_todo: String,work_todo: String) {
        detailModel?.perEdit(list: list,subj_todo:subj_todo,work_todo: work_todo)
    }
}

    


    
