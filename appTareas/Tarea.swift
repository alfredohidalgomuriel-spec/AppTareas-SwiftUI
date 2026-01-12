//
//  Tarea.swift
//  appTareas
//
//  Created by ALFREDO HIDALGO on 17/11/25.
//

import SwiftUI


struct Task : Identifiable, Codable, Hashable, Equatable {
    
  let id: UUID
    var title: String
    var isDone: Bool
    
    init(title:String,isDone:Bool){
        self.id = UUID()
        self.title = title
        self.isDone = isDone
        
  
    }
    
}
