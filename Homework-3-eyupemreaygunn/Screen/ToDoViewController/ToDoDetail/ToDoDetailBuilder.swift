//
//  ToDoDetailBuilder.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 24.09.2022.
//

import Foundation

class ToDoDetailBuilder : ViewModelToRouterDetailProtocol {
    static func createModule(ref: ToDoDetailViewController) {
        ref.detailViewModelNesnesi = ToDoDetailViewModel()
        ref.detailViewModelNesnesi?.detailModel = ToDoDetailModel()
    }
}
