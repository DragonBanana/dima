//
//  ResetViewRef.swift
//  CounterDIY
//
//  Created by Luca Terracciano on 22/12/22.
//

import SwiftUI

struct ResetViewRef: View {
    @ObservedObject var counter: Model
    
    var body: some View {
        Button(action: { counter.value = 0}) {
            Text("Reset").bold().font(.headline).accentColor(.white).padding(10).background(.blue)
        }
    }
}

struct ResetViewRef_Previews: PreviewProvider {
    @State static var counter: Model = Model()
    static var previews: some View {
        ResetViewRef(counter: counter)
    }
}
