//
//  Toy.swift
//  BabyGiraffe
//
//  Created by salma alorifi on 15/06/1444 AH.
//


import Foundation
import SwiftUI

struct Toy {
    let id : Int
    let color : Color
}

extension Toy{
    static let all = [
        Toy(id: 1, color: .red),
        Toy(id: 2, color: .blue),
        Toy(id: 3, color: .green),
        Toy(id: 4, color: .purple),
        Toy(id: 5, color: .orange),
        Toy(id: 6, color: .yellow)
        
        
        
    ]
    
    
}

