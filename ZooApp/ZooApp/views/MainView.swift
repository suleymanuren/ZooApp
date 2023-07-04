//
//  MainView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import SwiftUI

struct MainView: View {
    let animals : [AnimalsModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive : Bool = false
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Int = 1
    @State private var toolbarIcon : String = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    ScrollView {
                    VStack {
                        NavigationView {
                            List {
                                SliderView()
                                    .frame(height: 250)
                                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            }
                        }
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetail(animalsData: animal)) {
                                AnimalListView(animalsData: animal)
                            }
                        }
                    }
                    
                    }
                } else {
                    ScrollView (.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetail(animalsData: animal)) {
                                    AnimalGridItemView(animals: animal)
                                }
                            }
                        }.padding(10)
                            .animation(.easeIn)
                    }
                }
        }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }

            .padding([.top,.bottom], 1)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
