//
//  File.swift
//  
//
//  Created by Игорь Девин on 09.04.2024.
//

import Foundation
import Vapor

struct HotelQuery: Content {
    let sort: String
    let search: String
}
