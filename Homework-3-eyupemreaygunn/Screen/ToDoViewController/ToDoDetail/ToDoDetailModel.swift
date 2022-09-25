//
//  ToDoDetailModel.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 24.09.2022.
//

import Foundation
import CoreData

class ToDoDetailModel : ViewModelToModelDetailProtocol {
    func perEdit(list: ToDoModel,subj_todo: String,work_todo: String) {
        list.subj_todo = subj_todo
        list.work_todo = work_todo
        ad.saveContext()
        }
    }
