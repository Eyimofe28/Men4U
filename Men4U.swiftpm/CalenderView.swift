import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    private let calendar = Calendar.current
    private let dateRange: [Date]
    
    init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
        
        // Create an array of dates from today to the next 14 days
        let today = Date()
        var dates = [Date]()
        for offset in 0..<15 {
            if let date = calendar.date(byAdding: .day, value: offset, to: today) {
                dates.append(date)
            }
        }
        self.dateRange = dates
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(dateRange, id: \.self) { date in
                    CalendarDateView(date: date, isSelected: calendar.isDate(date, inSameDayAs: selectedDate))
                        .onTapGesture {
                            selectedDate = date
                        }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 70)
        .background(Color(.systemGray5))
    }
}

struct CalendarDateView: View {
    var date: Date
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Text(DateFormatter.shortWeekday.string(from: date))
                .font(.caption)
            Text(DateFormatter.day.string(from: date))
                .font(.headline)
                .padding(10)
                .background(isSelected ? Color.blue : Color.clear)
                .clipShape(Circle())
                .foregroundColor(isSelected ? .white : .primary)
        }
    }
}

extension DateFormatter {
    static var shortWeekday: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter
    }
    
    static var day: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }
}
