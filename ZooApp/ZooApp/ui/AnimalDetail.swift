//
//  AnimalDetail.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import SwiftUI

struct AnimalDetail: View {
    let animalsData : AnimalsModel
    var body: some View {
            VStack{
                    Image(animalsData.image ?? "")
                        .resizable()
                        .scaledToFit()
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                    
                
               
                Text(animalsData.name ?? "")
                    .fontWeight(.heavy)
                    .font(.title2)
                Divider()
                 .frame(width: 100,height: 5)
                 .background(Color.accentColor)
                
                Text(animalsData.headline ?? "")
                    .fontWeight(.medium)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                
                Spacer()
                HStack{
                    Image(systemName: "photo")
                        .foregroundColor(.accentColor)
                    Text("Wilderness in Pictures")
                        .fontWeight(.light)
                        .font(.title2)
                }
                
                TabView{
                    ForEach(animalsData.gallery ?? [],id: \.self) {animal in
                        Image(animal ?? "")
                            .resizable()
                            .scaledToFit()
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                            .padding(.horizontal,2)

                    }
                    
                }.tabViewStyle(PageTabViewStyle())
                    .frame(height: 250)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

        
            }.navigationTitle("Learn about \( animalsData.name ?? "")")
    }
}

struct AnimalDetail_Previews: PreviewProvider {
    static let animals : [AnimalsModel] = Bundle.main.decode("animals.json")

    static var previews: some View {
        AnimalDetail(animalsData: animals[0])
    }
}
