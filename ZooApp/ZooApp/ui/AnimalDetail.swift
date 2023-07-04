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
        ScrollView {
            VStack{
                //animal title start
                Group{
                    Image(animalsData.image ?? "")
                        .resizable()
                        .scaledToFit()
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                    
                    Text(animalsData.name?.uppercased() ?? "")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .foregroundColor(.primary)
                        .background(
                            Color.accentColor
                                .frame(height: 6)
                                .offset(y: 24)
                                .opacity(0.75)
                        )
                    
                    
                    //                Divider()
                    //                 .frame(width: 100,height: 5)
                    //                 .background(Color.accentColor)
                    
                    Text(animalsData.headline ?? "")
                        .fontWeight(.medium)
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                }
                //animal title end


                //animal gallery start
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
                //animal gallery end
                
                //facts start
                Group{
                    HStack{
                        Image(systemName: "info.circle")
                            .foregroundColor(.accentColor)
                        Text("Did you know ?")
                            .fontWeight(.heavy)
                            .font(.title3)
                    }
                    TabView{
                        ForEach(animalsData.fact ?? [],id: \.self) {animal in
                            Text(animal)
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                                .padding()
                        }
                        
                    }.tabViewStyle(PageTabViewStyle())
                        .frame(height: 200)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .background(.gray.opacity(0.2))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                }
                //facts end
                //maps start
                Group{
                    HStack{
                        Image(systemName: "map")
                            .foregroundColor(.accentColor)
                        Text("National Parks")
                            .fontWeight(.light)
                            .font(.title2)
                    }
                    AnimalDetailMap()
                }
                //maps end
                
                //animal about start
                Group{
                    HStack{
                        Image(systemName: "info.circle")
                            .foregroundColor(.accentColor)
                        Text("All about \(animalsData.name ?? "")")
                            .fontWeight(.light)
                            .font(.title2)
                    }
                    Text(animalsData.description ?? "")
                        .fontWeight(.light)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                //animal about end
                //wikipedia start
                Group{
                    Spacer()
                    HStack{
                        Image(systemName: "info.circle")
                            .foregroundColor(.accentColor)
                        Text("Learn more")
                            .fontWeight(.light)
                            .font(.title2)
                    }
                    HStack{
                        Image(systemName: "network")
                        Text("Wikipedia")
                        Spacer()
                        Image(systemName: "arrow.up.right.square")
                            .foregroundColor(Color.accentColor)
                        Text(animalsData.name ?? "")
                            .foregroundColor(Color.accentColor)
                        
                    }
                    .padding()
                    .onTapGesture {
                        
                        if let url = URL(string: animalsData.link ?? "") {
                            UIApplication.shared.open(url)
                        }
                    }
                    .background(.bar)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
                }
                
                //wikipedia end
                
            }.navigationTitle("Learn about \( animalsData.name ?? "")")
                .padding()
        }
    }
}

struct AnimalDetail_Previews: PreviewProvider {
    static let animals : [AnimalsModel] = Bundle.main.decode("animals.json")

    static var previews: some View {
        AnimalDetail(animalsData: animals[0])
    }
}
