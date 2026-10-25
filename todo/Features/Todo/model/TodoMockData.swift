//
//  TodoMockData.swift
//  todo
//
//  Created by ahmed khaled ibrahim on 25/10/2026.
//

import Foundation

let todosMockData: [TodoModel] = (1...10).map { i in
    TodoModel(
        title: "Any title \(i)",
        details: "Details \(i)",
        dueDate: .now,
        isCompleted: Bool.random(),
        priority: [TodoPriority.low, TodoPriority.medium, TodoPriority.high]
            .randomElement()!,
        category: ["Work", "Personal", "Study"].randomElement()!,
        isPinned: Bool.random()
    )
}
