//
//  DatosUsuarios.swift
//  appTareas
//
//  Created by ALFREDO HIDALGO on 17/11/25.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    
    // PUBLICA CAMBIOS EN TIEMPO REAL
    @Published var tasks: [Task] = defaultTasks {
        didSet { saveTasks() }   // Guarda cada vez que cambian
    }

    init() {
        loadTasks()              // Carga al arrancar la app
    }

    // Guarda las tareas en UserDefaults
    private func saveTasks() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: "tasks")
        }
    }

    // Recupera las tareas guardadas
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: "tasks"),
           let decoded = try? JSONDecoder().decode([Task].self, from: data) {
            self.tasks = decoded
        }
    }
}

// Lista inicial vacía
let defaultTasks: [Task] = []
