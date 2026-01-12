//
//  listaDeTareas.swift
//  appTareas
//
//  Created by ALFREDO HIDALGO on 17/11/25.


import SwiftUI

struct listaDeTareas: View {
    @EnvironmentObject  var userData: UserData
    @State var draftTitle: String = ""
    @State var isEditing: Bool = false
    
    
    var body: some View {
        NavigationView{
            List{
                TextField("Crear Una Nueva Tarea", text: $draftTitle).submitLabel(.done)// llamar a la tarea
                    .onSubmit{
                        createTask()
                    }
                
                ForEach(userData.tasks){
                    task in  VistaDeElementoDeTarea(task: task, isEditing: $isEditing)
                }
                
            }
            
            .navigationTitle(Text("Tareas"))
            .navigationBarItems(trailing: Button(action:{ isEditing.toggle() } ) {
                if  !self.isEditing{
                   Text("Editar")
                }else{
                Text ("Done")
                        .bold()
                }
            } )
            
        }
    }
    func createTask(){
        let newTask = Task(title: self.draftTitle,isDone: false)
        self.userData.tasks.insert(newTask, at: 0)
        self.draftTitle = ""
   
    }
    
}

#Preview {
    let userdata = UserData()  // Creamos un UserData para usar en el preview
    return listaDeTareas().environmentObject(userdata)// lo eyectamos a la vista
}
