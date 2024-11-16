//
//  ContentView.swift
//  ToDo List
//
//  Created by Evgeniy Borovoy on 11/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTodo = ""
    @State private var todos: [Item] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("New todo..", text: $currentTodo).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        guard !self.currentTodo.isEmpty else { return }
                        self.todos.append(Item(id: UUID(), todo: self.currentTodo))
                        self.currentTodo = ""
                        save()
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding(.leading, 5)
                }.padding()
                List {
                    ForEach(todos) { item in
                        Text(item.todo)
                    }.onDelete(perform: delete)
                }
            }
            .navigationTitle("Todo List")
        }.onAppear(perform: load)
    }
    
    private func save() {
        UserDefaults.standard.set(
            try? PropertyListEncoder().encode(self.todos),
            forKey: "myTodos"
        )
    }
    
    private func load() {
        if let todosData = UserDefaults.standard.value(forKey: "myTodos") as? Data {
            if let todosList = try? PropertyListDecoder().decode(Array<Item>.self, from: todosData) {
                self.todos = todosList
            }
        }
    }
    
    private func delete(at offset: IndexSet) {
        self.todos.remove(atOffsets: offset)
        save()
    }
}

#Preview {
    ContentView()
}
