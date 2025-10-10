//
//  ContentView.swift
//  AsyncImagesDIY
//
//  Created by Luca Terracciano on 22/12/22.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    @State private var lastId: Int = Int.random(in: 0...1000)
    @State private var history: [ImageData] = []
    
    var body: some View {
        let url: URL = URL(string: "https://picsum.photos/id/\(lastId)/600")!
        NavigationView{
            VStack{
                URLImage(url, failure: {_, _ in
                    Text("Image missing.")
                }, content: {image in
                    image.resizable().aspectRatio(contentMode: .fit)
                })
                Button(action: {
                    history.append(ImageData(url: url))
                    lastId=Int.random(in: 0...1000)
                }) {
                    Text("Next").bold().font(.callout).accentColor(.white).padding(10).background(.blue)
                }
                NavigationLink(destination: HistoryView(history: $history)) {
                    Text("History").bold().font(.callout).accentColor(.white).padding(10).background(.blue)
                }
            }.navigationBarTitle("Random Images")
        }
    }
}

struct HistoryView: View {
    @Binding var history: [ImageData]
    
    var body: some View {
        List(history) { image in
            URLImage(image.url, failure: {_, _ in
                Text("Image missing.")
            }, content: {image in
                image.resizable().aspectRatio(contentMode: .fit)
            })
        }.navigationBarTitle("History").navigationBarItems(trailing: Button(action: {history.removeAll()}) {
            Image(systemName: "trash").imageScale(.large)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
