//
//  editarTareasDeVista.swift
//  appTareas
//
//  Created by ALFREDO HIDALGO on 17/11/25.
//

import SwiftUI

struct editarTareasDeVista: View {
    @EnvironmentObject var userData : UserData
    private let task : Task
    private var draftTitle : State<String>
    init(task :Task) {
        self.task = task
        self.draftTitle = .init(initialValue: task.title)
    }
    
    var body: some View {
        let inset = EdgeInsets(top: -8, leading: -10, bottom: -7, trailing: -10)
        
        VStack(alignment: .leading, spacing: 0) {
            TextField ("Entra Nuevo Titulo", text:draftTitle.projectedValue){
                _ in updateTask()
            }
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color.clear)
                    .background(RoundedRectangle(cornerRadius : 5).strokeBorder(Color( red: 07,green: 0.7, blue: 0.7),lineWidth: 1/UIScreen.main.scale))
        )
            .padding(EdgeInsets(top:15 - inset.top,leading: 20 - inset.leading,bottom: 15 - inset.bottom,trailing: 20 - inset.trailing))
            Spacer()
        }
        .navigationBarTitle("Editar Tarea")
    }
    private func updateTask() {
       guard let index = userData.tasks.firstIndex(of: task) else { return }
        userData.tasks[index].title = draftTitle.wrappedValue
        
    }
    
}

