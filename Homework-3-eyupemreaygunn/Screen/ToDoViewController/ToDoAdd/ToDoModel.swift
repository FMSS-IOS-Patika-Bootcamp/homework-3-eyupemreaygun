//
//  ToDoModel.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 24.09.2022.
//

import Foundation
import CoreData


class ToDoAddModel : ViewModelToModelAddProtocol {
 let context = ad.persistentContainer.viewContext
    
    func add(work_todo: String,subj_todo: String) {
        let list = ToDoModel(context: context)
        list.work_todo = work_todo
        list.subj_todo = subj_todo
        ad.saveContext()
        
    
    }
    
    

    
    
    
    
}


