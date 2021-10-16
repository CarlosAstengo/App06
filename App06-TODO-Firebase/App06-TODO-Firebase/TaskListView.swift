//
//  App06_TODO_FirebaseApp.swift
//  App06-TODO-Firebase
//
//  Created by Carlos Astengo Macias on 07/10/21.
//

import SwiftUI
import FirebaseFirestore

struct TaskListView: View {
    
    @StateObject var taskModel = TaskModel()
    @AppStorage("title", store: UserDefaults(suiteName: "App06-TODO")) var title: String = "Tarea"
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    if taskModel.tasks.count > 0 {
                        ForEach(taskModel.tasks) { task in
                            NavigationLink(destination: TaskDetailView(taskModel: taskModel, task: task, mode: .edit)) {
                                Image(systemName: task.is_completed ? "circle" : "checkmark.circle.fill")
                                Text(task.task)
                            }
                            
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                deleteTask(task: taskModel.tasks[index])
                            }
                        }
                    } else {
                        Text("No tareas")
                    }
                }
                VStack {
                    Spacer()
                    NavigationLink(destination: TaskDetailView(taskModel: taskModel, task: Task.dummy, mode: .add)) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                    }
                }
            }
            .navigationBarTitle(title, displayMode: .inline)
            .listStyle(DefaultListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.title)
                        .foregroundColor(.orange)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteTask(task: Task) {
        
        taskModel.removeData(task: task)
        
    }
    
    func addTask() {
        
        let task = Task(task: "Tarea", category_id: "01", priority_id: "01", is_completed: false, date_created: Date(), due_date: Date())
        
        taskModel.addData(task: task)
        
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
