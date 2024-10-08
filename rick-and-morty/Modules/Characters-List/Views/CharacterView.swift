//
//  CharacterView.swift
//  rick-and-morty
//
//  Created by Celal on 8.10.2024.
//

import SwiftUI

struct CharacterView: View {
    let character:Result
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 96, height: 96)
            .clipShape(.rect(cornerRadius: 25))
            VStack(alignment: .leading){
                Text("Name: "+character.name)
                HStack{
                    Text("Status: " + character.status + " - " + character.species )
                    Image(systemName: "circle.fill").foregroundStyle(character.status == "Alive" ? .green : (character.status == "Dead" ? .red : .gray))
                }
                Text("Gender: " + character.gender)
            }
        }
    }
}

#Preview {
    CharacterView(character: Result(id: 1, name: "Rick Sanchez", status: "Alive", species: "sa", type: "sa", gender: "sa", origin: Location(name: "sa", url: "sa"), location: Location(name: "sa", url: "sa"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["sa"], url: "sa", created: "sa"))
}
//{
//      "id": 1,
//      "name": "Rick Sanchez",
//      "status": "Alive",
//      "species": "Human",
//      "type": "",
//      "gender": "Male",
//      "origin": {
//        "name": "Earth",
//        "url": "https://rickandmortyapi.com/api/location/1"
//      },
//      "location": {
//        "name": "Earth",
//        "url": "https://rickandmortyapi.com/api/location/20"
//      },
//      "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
//      "episode": [
//        "https://rickandmortyapi.com/api/episode/1",
//        "https://rickandmortyapi.com/api/episode/2",
//        // ...
//      ],
//      "url": "https://rickandmortyapi.com/api/character/1",
//      "created": "2017-11-04T18:48:46.250Z"
//    }
