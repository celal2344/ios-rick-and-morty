//
//  rick_and_mortyApp.swift
//  rick-and-morty
//
//  Created by Celal on 6.10.2024.
//

import SwiftUI

@main
struct rick_and_mortyApp: App {
    @AppStorage("theme") var theme: String = ""
    var body: some Scene {
        WindowGroup {
            MainPageView()
                .preferredColorScheme(theme == "" ? .none : theme == "dark" ? .dark : .light)
        }
    }
}
