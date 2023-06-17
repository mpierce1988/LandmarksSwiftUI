//
//  ContentView.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
                
            Text("Turtle Rock")
                .font(.title)
                .foregroundColor(Color.black)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")}
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
