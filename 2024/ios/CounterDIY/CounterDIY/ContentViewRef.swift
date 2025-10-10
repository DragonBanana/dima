//
//  ContentViewRef.swift
//  CounterDIY
//
//  Created by Luca Terracciano on 22/12/22.
//

import SwiftUI

struct ContentViewRef: View {
    
    @StateObject var counter: Model = Model()
    
    var body: some View {
        VStack{
            Text("\(Int(counter.value))").bold().font(.title)
            HStack{
                Button(action: {counter.subOne()}) {
                    Text("-1").bold().font(.headline).accentColor(.white).padding(10).background(.blue)
                }.disabled(counter.value <= 0)
                Button(action: {counter.addOne()}) {
                    Text("+1").bold().font(.headline).accentColor(.white).padding(10).background(.blue)
                }.disabled(counter.value >= 10)
            }
            Slider(value: $counter.value, in: 0...10, step: 1).padding(10)
            ResetViewRef(counter: counter)
        }
    }
}

struct ContentViewRef_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRef()
    }
}
