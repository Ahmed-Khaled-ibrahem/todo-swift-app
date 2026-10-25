//
//  DayCell.swift
//  todo
//
//  Created by ahmed khaled ibrahim on 25/10/2026.
//

import SwiftUI

struct DayCell: View {
    let date: Date
    let isSelected: Bool
    let isToday: Bool

    var body: some View {
        VStack(spacing: 0) {
            Text(
                date.formatted(
                    .dateTime.weekday(isSelected ? .wide : .abbreviated)
                )
            )
            .font(.caption)
            Text(date.formatted(.dateTime.day()))
                .font(.title3.bold())
            Circle()
                .fill(isToday ? Color.accentColor : .clear)
                .frame(width: 5, height: 5)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .foregroundStyle(isSelected ? .white : .primary)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(isSelected ? Color.accentColor : Color.gray.opacity(0.12))
        )
    }
}

// perview
#Preview {
    DayCell(date: .now, isSelected: true, isToday: false)
    DayCell(date: .now, isSelected: true, isToday: true)
    DayCell(date: .now, isSelected: false, isToday: false)
    DayCell(date: .now, isSelected: false, isToday: true)
}
