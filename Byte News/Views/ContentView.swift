//
//  ContentView.swift
//  Byte News
//
//  Created by Burak Eryavuz on 30.03.2023.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("Byte News")
            .toolbarBackground(Color.gray,for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
            
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}




//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "World"),
//    Post(id: "3", title: "I'm Burak Eryavuz")
//
//
//
//]
