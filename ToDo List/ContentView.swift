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
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding(.leading, 5)
                }.padding()
                List {
                    ForEach(todos) { item in
                        Text(item.todo)
                    }
                }
            }
            .navigationTitle("Todo List")
        }
    }
}

#Preview {
    ContentView()
}
