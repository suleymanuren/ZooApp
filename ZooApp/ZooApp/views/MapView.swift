//
//  MapView.swift
//  ZooApp
//
//  Created by Bulut Sistem on 3.07.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var animals : [AnimalsLocationModel] = Bundle.main.decode("locations.json")
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437599),
        span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
    )
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region, annotationItems: animals) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    MapAnnotationView(location: location)
                }
            }.overlay(
                HStack{
                    Spacer()
                    Image("launch-screen-image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                    VStack{
                        Text("Latitude: ")
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                            .font(.footnote)
                            .frame(maxWidth: .infinity , alignment : .leading)

                        Text("Longitude: ")
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                            .font(.footnote)
                            .frame(maxWidth: .infinity , alignment : .leading)
                    }
                    VStack{
                        Text("\(region.center.latitude)")
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                            .font(.footnote)
                            .frame(maxWidth: .infinity , alignment : .trailing)

                        Text("\(region.center.longitude)")
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                            .font(.footnote)
                            .frame(maxWidth: .infinity , alignment : .trailing)
                    }
                    .padding()
                }.background(.brown)
                    .cornerRadius(12)
                    .padding()
                ,alignment: .top
            )
            

            
        }
        
   
    }
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct MapAnnotationView : View {
    let location : AnimalsLocationModel
    @State private var animation : Double = 0.0

    var body: some View {
        ZStack{
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54,height: 54,alignment: .center)
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(location.image ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48,alignment: .center)
                .clipShape(Circle())
        }.onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}
