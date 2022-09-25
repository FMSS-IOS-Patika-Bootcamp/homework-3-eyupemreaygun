//
//  Router.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 24.09.2022.
//

import Foundation
class ToDoAddBuilder: ViewModelToRouterAddProtocol {
    static func createModule(ref: ToDoAddViewController) {
        ref.addViewModelNesnesi = ToDoViewModel()
        ref.addViewModelNesnesi?.ToDoAddModel = ToDoAddModel()

    }
}
