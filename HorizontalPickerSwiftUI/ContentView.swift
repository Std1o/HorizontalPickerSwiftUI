import Foundation
import SwiftUI
import UIKit

struct ContentView: View {
    @State private var bgndColor = Color.white
    
    @State var selected: Int = -1
    
    var roundedRadius: Int = 8
    
    var itemBgndColor = Color.init(hex: "E0E0E0")
    var itemInnerColor = Color.init(hex: "333333")

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(0..<10, id: \.self) { idx in
                    ZStack {
                        if selected == idx {
                            Rectangle()
                                //.fill(self.bgndColor)
                                .fill(Color.black)
                                .frame(width: 40, height: 40)
                                .cornerRadius(CGFloat(roundedRadius))
                                .padding(.horizontal, 4)
                            Text("\(idx)")
                                .foregroundColor(Color.white)
                        } else {
                            Rectangle()
                                //.fill(self.bgndColor)
                                .fill(Color.white)
                                //.colorInvert()
                                .frame(width: 40, height: 40)
                                .cornerRadius(CGFloat(roundedRadius))
                                .padding(.horizontal, 4)
                            Text("\(idx)")
                                .foregroundColor(Color.black)
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
}

struct HIconScroller: View {
    @State private var bgndColor = Color.white
    
    @State var selected: String = "-1"
    
    var icons: Array<String>
    
    var roundedRadius: Int = 8
    
    var itemBgndColor = Color.init(hex: "E0E0E0")
    var itemInnerColor = Color.init(hex: "333333")

    var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(icons, id: \.self) { idx in
                        ZStack {
                            if selected == idx {
                                Rectangle()
                                    //.fill(self.bgndColor)
                                    .fill(itemBgndColor)
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(CGFloat(roundedRadius))
                                    .padding(.horizontal, 4).padding(.vertical, 10)
                                Image(systemName: idx)
                                    .foregroundColor(itemInnerColor)
                            } else {
                                Rectangle()
                                    //.fill(self.bgndColor)
                                    .fill(itemBgndColor)
                                    //.colorInvert()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(CGFloat(roundedRadius))
                                    .padding(.horizontal, 4).padding(.vertical, 10)
                                Image(systemName: idx)
                                    .foregroundColor(itemInnerColor)
                            }
                        }
                        .onTapGesture {
                            selected = idx
                            //self.bgndColor = Color(red: Double.random(in: 0...1.0), green: Double.random(in: 0...1.0), blue: Double.random(in: 0...1.0))
                        }
                    }
                }
            }.frame(minWidth: 0, maxWidth: 400, minHeight: 0, maxHeight: 30)
    }
}

struct HScroller_Previews: PreviewProvider {
    static var previews: some View {
        //SmallTimeWidgetView(entry: SmallTimeEntry(date: Date(), configuration: SmallConfigurationIntent()))
        //    .previewContext(WidgetPreviewContext(family: .systemSmall))
        //HScroller()
        HIconScroller(icons: ["pencil", "cloud", "cloud.fill", "moon",
                              "moon.stars", "star", "star.circle", "star.fill", "text.badge.star"])
        //test().previewContext(WidgetPreviewContext(family: WidgetFamily.systemLarge))
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
