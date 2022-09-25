//
//  LabelPageEntity.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 20.09.2022.
//

import Foundation

struct PostCellViewModel {
    var title : String?
    var userId: Int?
    var id: Int?
    var body: String?
    
    
}
struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
   
}
