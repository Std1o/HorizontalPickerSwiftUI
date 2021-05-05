import Foundation
import SwiftUI
import UIKit

struct ContentView: View {
    @State private var bgndColor = Color.white
    
    @State var selected: Int = -1
    
    var roundedRadius: Int = 8

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

struct HScroller_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
