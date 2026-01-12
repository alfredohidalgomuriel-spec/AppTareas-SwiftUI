//
//  appTareasApp.swift
//  Created by ALFREDO HIDALGO on 17/11/25.


import SwiftUI

@main
struct appTareasApp: App {
    var body: some Scene {
        WindowGroup {
            listaDeTareas().environmentObject(UserData())
            
        }
    }
}
