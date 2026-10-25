//
//  DatePickerView.swift
//  todo
//
//  Created by ahmed khaled ibrahim on 25/10/2026.
//

import SwiftUI

struct DayPickerView: View {

    @Binding var selectedDay: Date
    @State private var showCalendar: Bool = false

    private let calendar = Calendar.current

    private let days: [Date] = (-30...30).compactMap {
        let today = Calendar.current.startOfDay(for: .now)
        return Calendar.current.date(byAdding: .day, value: $0, to: today)
    }

    private var selectedDayIsToday: Bool {
        calendar.isDateInToday(selectedDay)
    }

    private var selectedDayInDays: Bool {
        days.contains(selectedDay)
    }

    var body: some View {

        VStack {
            header
            if selectedDayInDays {
                daysStrip
            } else {
                pickedDateTile
            }

        }.sheet(isPresented: $showCalendar) {
            datePickerSheet
        }

    }
}

extension DayPickerView {

    private var header: some View {
        HStack {
            Button {
                withAnimation {
                    selectedDay = calendar.startOfDay(for: .now)
                }

            } label: {
                Text(selectedDayIsToday ? "Today" : "Back to Today")
            }.disabled(selectedDayIsToday)
            Spacer()
            Button {
                showCalendar = true
            } label: {
                Image(systemName: "calendar")
            }
        }.padding(.horizontal, 20)
    }

    // days strip view
    private var daysStrip: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(days, id: \.self) { day in
                        DayCell(
                            date: day,
                            isSelected: calendar.isDate(
                                day,
                                inSameDayAs: selectedDay
                            ),
                            isToday: calendar.isDateInToday(day)
                        )
                        .id(day)
                        .onTapGesture {
                            withAnimation {
                                selectedDay = day
                            }
                        }
                    }

                }
            }
            .onAppear {
                proxy.scrollTo(calendar.startOfDay(for: .now), anchor: .center)
            }
            .onChange(of: selectedDay) {
                withAnimation {
                    proxy.scrollTo(selectedDay, anchor: .center)
                }
            }
        }
    }

    // date picker sheet
    private var datePickerSheet: some View {
        DatePicker(selection: $selectedDay, displayedComponents: .date) {
            Text("Select a date")
        }
        .datePickerStyle(.graphical)
        .padding(20)
        .presentationDetents([.medium])
        .onChange(of: selectedDay) {
            withAnimation {
                showCalendar = false
            }
        }
    }

    private var pickedDateTile: some View {
        GroupBox(
            content: {
                Text(selectedDay, style: .date)
            },
            label: {
                Text("Selected Day")
            }
        ).padding(20)
    }
}

#Preview {
    @Previewable @State var day = Date.now
    DayPickerView(selectedDay: $day)
}
