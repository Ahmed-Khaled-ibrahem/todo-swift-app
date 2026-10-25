//
//  TodayTodoList.swift
//  todo
//
//  Created by ahmed khaled ibrahim on 25/10/2026.
//

import SwiftUI

struct TodoListForDay: View {

    @State private var selectedDay: Date = .now

    var body: some View {

        VStack {
            DayPickerView(selectedDay: $selectedDay)
            List(todosMockData) { todo in
                TodoItemView(todo: todo)
            }.listStyle(.sidebar)
                .scrollContentBackground(.hidden)
                .listRowSeparator(.hidden)
        }
    }
}



struct TodoItemView: View {

    let todo: TodoModel

    var body: some View {
        Text(todo.title)
    }
}

#Preview {
    TodoListForDay()
}
