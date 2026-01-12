//
//  VistaDeElementoDeTarea.swift
//  appTareas
//
//  Created by ALFREDO HIDALGO on 17/11/25.
//

import SwiftUI

struct VistaDeElementoDeTarea: View {
    
    @EnvironmentObject var userData: UserData
    let task : Task
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack{
            if isEditing {
                Button(action: borrarTarea) {
                                   Image(systemName: "minus.circle.fill")
                                       .foregroundColor(.red)
                                       .font(.title3)
                    }
                
                Text(task.title)
                    .foregroundColor(.primary)
                
                Spacer()
            }else{
                Button(action:{cambiarElEstado()}){
                    Text(task.title)
                        .foregroundColor(.primary)
                }
                Spacer()
                if task.isDone {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
        }
        
        .padding(.vertical,6)
        
    }
    // Cambia el estado isDone de la tarea dentro del arreglo userData.tasks
    
    private func cambiarElEstado() {
        // Evitar cambiar estado si estamos en modo edición
        guard  !isEditing else { return}
        if let index = userData.tasks.firstIndex(where: {$0.id == task.id }){
            
            userData.tasks[index].isDone.toggle()
        }
    }
    
    private func borrarTarea() {
        userData.tasks.removeAll(where:{$0.id == task.id})
        if userData.tasks.isEmpty {
            self.isEditing = false
            
        }
    }
    
    // Preview — para que funcione el preview debes inyectar un EnvironmentObject.
    // Asegúrate de que UserData tenga init() público; si no, adapta este preview.
    struct VistaDeElementoDeTarea_Previews: PreviewProvider {
        static var previews: some View {
            // Crear un Task de ejemplo; aquí asumimos que Task tiene init(title:isDone:)
            let sampleTask = Task(title: "Tarea de ejemplo", isDone: false)
            let ud = UserData() // usa tu UserData real; debe tener init() por defecto
            
            return VistaDeElementoDeTarea(task: sampleTask, isEditing: .constant(false))
                .environmentObject(ud)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
