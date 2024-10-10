import SwiftUI

struct MainPageView: View {
    @State private var isDarkMode: Bool = false

    var body: some View {
        NavigationStack {
            ZStack{
                Image(isDarkMode ? "walpaper_dark" : "wallpaper_light")
                    .resizable()
                    .opacity(0.9)
                    .ignoresSafeArea()
                    .animation(.default, value: isDarkMode)
                VStack {
                    HStack{
                        Spacer()
                        Button(action: {
                            isDarkMode.toggle()
                            UserDefaults.standard.set(isDarkMode ? "dark": "", forKey: "theme")
                        }) {
                            ZStack {
                                Image(isDarkMode ? "theme_button_dark" : "theme_button_light")
                                    .frame(width: 90, height: 90, alignment: .center)
                                    .clipShape(.circle)
                            }
                        }
                    }
                    Text("RICK and MORTY")
                        .font(.system(size: 85, weight: .bold, design: .rounded))
                        .environment(\._lineHeightMultiple, 0.8)
                        .multilineTextAlignment(.center)
                        .padding()
                    HStack{
                        Spacer()
                        NavigationLink(destination: CharacterListView()) {
                            VStack{
                                Image(systemName: "person.3.fill")
                                Text("Characters")
                            }
                        }
                        Spacer()
                        NavigationLink(destination: LocationsListView()) {
                            VStack{
                                Image(systemName: "map.fill")
                                Text("Locations")
                            }
                        }
                        Spacer()
                        NavigationLink(destination: EpisodesListView()) {
                            VStack{
                                Image(systemName: "play.square.fill")
                                Text("Episodes")
                            }
                        }
                        Spacer()
                    }
                    .imageScale(.large)
                    Spacer()
                }
                .foregroundStyle(isDarkMode ? .white : .black)
                .padding()
            }
        }
    }
}

#Preview {
    MainPageView()
}
