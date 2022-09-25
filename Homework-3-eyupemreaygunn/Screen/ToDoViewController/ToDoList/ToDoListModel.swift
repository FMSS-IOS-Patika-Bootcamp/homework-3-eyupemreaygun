//
//  ToDoListModel.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 23.09.2022.
//

import Foundation
import CoreData
import UIKit

class ToDoListModel : ViewModelToModelProtocol {
    var toDoListViewModel: ModelToViewModelProtocol?
    let context = ad.persistentContainer.viewContext

    
    
    func allNotes() {
        do {
            let list = try context.fetch(ToDoModel.fetchRequest())
            toDoListViewModel?.ViewModelaVeriGonder(toDoList: list)
            
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete(list: ToDoModel) {
        context.delete(list)
        ad.saveContext()
        allNotes()
        
    }
}
