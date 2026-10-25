//
//  TodoModel.swift
//  todo
//
//  Created by ahmed khaled ibrahim on 24/10/2026.
//

import Foundation

class TodoModel: Identifiable {
    let id = UUID().uuidString
    var title: String
    var details: String?
    var dueDate: Date?
    var isCompleted: Bool
    var priority: TodoPriority
    var category: String?
    var isPinned: Bool

    init(
        title: String,
        details: String? = nil,
        dueDate: Date? = nil,
        isCompleted: Bool = false,
        priority: TodoPriority = .low,
        category: String? = nil,
        isPinned: Bool = false
    ) {
        self.title = title
        self.details = details
        self.dueDate = dueDate
        self.isCompleted = isCompleted
        self.priority = priority
        self.category = category
        self.isPinned = isPinned
    }
}

enum TodoPriority {
    case low
    case medium
    case high
}
