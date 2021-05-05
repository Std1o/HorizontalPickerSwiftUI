import Foundation
import SwiftUI
import UIKit

struct ContentView: View {
    @State private var bgndColor = Color.white
    
    @State var selected: Int = -1
    
    var roundedRadius: Int = 8
    var dayNames = ["ПН", "ВТ", "СР", "ЧТ", "ПТ", "СБ", "ВС"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(0..<7, id: \.self) { idx in
                    VStack {
                        if selected == idx {
                            Text(dayNames[idx % 7]).font(.caption2)
                            ZStack {
                                Rectangle()
                                    //.fill(self.bgndColor)
                                    .fill(Color.black)
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(CGFloat(roundedRadius))
                                    .padding(.horizontal, 4)
                                Text("\(getDays()[idx])")
                                    .foregroundColor(Color.white)
                            }
                        } else {
                            Text(dayNames[idx % 7]).font(.caption2)
                            ZStack {
                                Rectangle()
                                    //.fill(self.bgndColor)
                                    .fill(Color.white)
                                    //.colorInvert()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(CGFloat(roundedRadius))
                                    .padding(.horizontal, 4)
                                Text("\(getDays()[idx])")
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                    .onTapGesture {
                        selected = idx
                        //self.bgndColor = Color(red: Double.random(in: 0...1.0), green: Double.random(in: 0...1.0), blue: Double.random(in: 0...1.0))
                    }
                }
            }
        }).frame(minWidth: 0, maxWidth: 400, minHeight: 0, maxHeight: 30)
    }
    
    func getDays() -> [String] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let dayOfWeek = calendar.component(.weekday, from: today)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
        
        let dayIndexFormatter = DateFormatter()
        let dayFormatter = DateFormatter()
        dayIndexFormatter.dateFormat = "e"
        dayFormatter.dateFormat = "dd"
        var resultDays = [String]()
        for date in days {
            let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date)
            resultDays.append(dayFormatter.string(from: tomorrow!))
        }
        return resultDays
    }
}

struct HScroller_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
