//
//  MainView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import SwiftUI

struct MainView: View {
    let animals : [AnimalsModel] = Bundle.main.decode("animals.json")
    var body: some View {
        ScrollView {
            VStack {
                NavigationView {
                    List {
                        SliderView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetail(animalsData: animal)) {
                        AnimalListView(animalsData: animal)
                    }
                }
            }
        }.padding([.top,.bottom], 1)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
