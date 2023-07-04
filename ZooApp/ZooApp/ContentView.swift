//
//  ContentView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTabIndex) {
                MainView()
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                        Text("Browse")
                    }
                    .tag(0)
                
                VideoListView()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Watch")
                    }
                    .tag(1)
                
                MapView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Location")
                    }
                    .tag(2)
                
                GalleryView()
                    .tabItem {
                        Image(systemName: "photo")
                        Text("Gallery")
                    }
                    .tag(3)
            }
            .navigationBarTitle(getTitle(for: selectedTabIndex))
            // Set the top bar title dynamically
        }
    }
    
    func getTitle(for index: Int) -> String {
        switch index {
        case 0:
            return "Animals"
        case 1:
            return "Watch"
        case 2:
            return ""
        case 3:
            return "Gallery"
        default:
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




