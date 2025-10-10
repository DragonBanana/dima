//
//  ResetView.swift
//  CounterDIY
//
//  Created by Luca Terracciano on 22/12/22.
//

import SwiftUI

struct ResetView: View {
    
    @Binding var counter: Float
    
    var body: some View {
        Button(action: { counter = 0}) {
            Text("Reset").bold().font(.headline).accentColor(.white).padding(10).background(.blue)
        }
    }
}

struct ResetView_Previews: PreviewProvider {
    @State static var counter: Float = 0
    static var previews: some View {
        ResetView(counter: $counter)
    }
}
