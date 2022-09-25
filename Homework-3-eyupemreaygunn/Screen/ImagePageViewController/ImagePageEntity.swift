//
//  ImagePageEntity.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 22.09.2022.
//

import Foundation

struct PhotosCellViewModel {
    var url: String?
    var thumbnailUrl: String?
    var title: String?
}

struct Photos: Decodable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
 
}
