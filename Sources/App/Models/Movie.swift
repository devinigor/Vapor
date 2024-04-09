//
//  File.swift
//  
//
//  Created by Игорь Девин on 09.04.2024.
//

import Foundation
import Fluent
import Vapor

final class Movie: Model, Content {
    
   static let schema: String = "movies"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    init() { }
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
    
}
