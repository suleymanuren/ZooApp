//
//  VideoListView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import SwiftUI
import AVKit

struct VideoListView: View {
    @State var animals : [AnimalsVideoModel] = Bundle.main.decode("videos.json")
    @State private var isSheetOpen = false
    @State var selectedAnimal: AnimalsVideoModel? // Add a state variable to track the selected animal

    var body: some View {
        List(animals) { animal in
            HStack{
                ZStack {
                    Image(animal.id ?? "")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .frame(width: 150)
                    
                    Button(action: {
                        selectedAnimal = animal // Set the selected animal when the button is tapped
                    }) {
                        Image(systemName: "play.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                    }
                    .sheet(item: $selectedAnimal) { selectedAnimal in
                        let videoURL = Bundle.main.url(forResource: selectedAnimal.id, withExtension: "mp4")
                        let player = AVPlayer(url: videoURL!)
                        //SEÇİLEN HAYVANIN VİDEOSU BAŞLIYOR
                        VideoPlayer(player: player)
                            .onDisappear {
                                // Stop the video when the sheet is dismissed
                                player.pause()
                            }
                            .onAppear{
                                player.play()
                            }
                            .presentationDetents([.fraction(0.4)]) //SHEET SIZE
                    }
                }
                Spacer()
                VStack{
                    Text(animal.name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.accentColor)
                    Text(animal.headline ?? "")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.top, 1)
        
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

