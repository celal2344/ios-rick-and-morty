//
//  Nav-Bar.swift
//  rick-and-morty
//
//  Created by Celal on 7.10.2024.
//

import SwiftUI

struct Nav_Bar: View {
    var body: some View {
        NavigationStack {
            HStack{
                NavigationLink{}label:{
                    VStack{
                        Image(systemName: "person.3.fill")
                        Text("Characters")
                    }
                }
                .padding()
                NavigationLink{}label:{
                    VStack{
                        Image(systemName: "map.fill")
                        Text("Locations")
                    }
                }
                .padding()
                NavigationLink{}label:{
                    VStack{
                        Image(systemName: "play.square.fill")
                        Text("Episodes")
                    }
                }
                .padding()
            }
            .background(Color(.black))
        }
    }
}

#Preview {
    Nav_Bar()
}
