//
//  GalleryView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import SwiftUI

struct GalleryView: View {
    @State var animals : [AnimalsModel] = Bundle.main.decode("animals.json")
    @State private var imageString  = ""

    //EFFICIENT GRID DEFINITION
    //let gridLayout : [GridItem] = Array (repeating: GridItem(.flexible()),count: 4)
    
    
    //DYNAMIC GRID LAYOUT
    @State private var gridLayout : [GridItem] =  [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
    func gridSwitch () {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ZStack{
                    Circle()
                        .frame(width: 250,height: 250)
                    Image(imageString == "" ? "lion" : imageString)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 240,height: 240)
                        .clipShape(Circle())
                    
                }
                Slider(value: $gridColumn, in:  2...4,step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                    gridSwitch()
                    })
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 20) {
                    ForEach(animals) { item in
                        ZStack{
                            Circle()
                                .frame(width: 90,height: 90)
                            Image(item.id ?? "")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 85,height: 85)
                                .clipShape(Circle())
                        }.padding()
                            .onTapGesture {
                                withAnimation {
                                    imageString = item.id ?? ""
                                }
                            }
                    }
                }
                
            }
            .onAppear{
                gridSwitch()
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(MotionAnimationView())
            .padding([.top,.bottom],1)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
