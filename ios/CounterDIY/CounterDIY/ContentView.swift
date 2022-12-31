//
//  ContentView.swift
//  CounterDIY
//
//  Created by Luca Terracciano on 22/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var counter: Float = 0
    
    var body: some View {
        VStack{
            Text("\(Int(counter))").bold().font(.title)
            HStack{
                Button(action: {counter -= 1}) {
                    Text("-1").bold().font(.headline).accentColor(.white).padding(10).background(.blue)
                }.disabled(counter <= 0)
                Button(action: {counter += 1}) {
                    Text("+1").bold().font(.headline).accentColor(.white).padding(10).background(.blue)
                }.disabled(counter >= 10)
            }
            Slider(value: $counter, in: 0...10, step: 1).padding(10)
            ResetView(counter: $counter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
