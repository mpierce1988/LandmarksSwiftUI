//
//  ContentView.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
                
            Text("Turtle Rock")
                .font(.title)
                .foregroundColor(Color.black)
            Text("Joshua Tree National Park")
                .font(.subheadline)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
