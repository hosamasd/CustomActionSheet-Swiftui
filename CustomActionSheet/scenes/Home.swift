//
//  Home.swift
//  CustomActionSheet
//
//  Created by Hossam on 11/25/20.
//

import SwiftUI
import MapKit

struct Home: View {
    
    @State var corrdinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.025, longitude: -122.1235), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    @State var filters:[Filter] = [
        Filter(title:"MOST",checked:false),
        Filter(title:"PUBLIC",checked:false),
        Filter(title:"ARRIVE",checked:false),
        Filter(title:"RECENT",checked:false),
        Filter(title:"HASH",checked:false),
        Filter(title:"POOL",checked:false),
    ]
    @State var edgeInsets = UIApplication.shared.windows.first?.safeAreaInsets
    @State var showFilter:Bool = false
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            Map(coordinateRegion: $corrdinate)
                .ignoresSafeArea()
            
            Button(action: {
                withAnimation{showFilter.toggle()}
            }, label: {
                
                Image(systemName: "slider.vertical.3")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.vertical,10)
                    .padding(.horizontal,15)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.65), radius: 15, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.65), radius: 15, x: -5, y: 5)
            })
            .padding(.trailing)
            .padding(.top,10)
            
            VStack {
                
                Spacer()
                
                
                VStack(spacing:15) {
                    
                    HStack {
                        
                        Text("Search by")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{showFilter.toggle()}
                        }) {
                            
                            Text("Done")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            
                        }
                    }
                    .padding([.horizontal,.top])
                    .padding(.bottom,10)
                    
                    ForEach(filters) {filter in
                        
                        CardView(filter: filter)
                    }
                    
                }
                .padding(.bottom,10)
                .padding(.bottom,edgeInsets?.bottom)
                .padding(.top,20)
                .background(Color.white.clipShape(CustomCorners(corners: [.topLeft,.topRight])))
                .offset(y: showFilter ? 0 : UIScreen.main.bounds.height/2)
                
            }
            .ignoresSafeArea()
            .background(
                
                Color.black.opacity(0.3).ignoresSafeArea()
                    .opacity(showFilter ? 1 : 0)
                    
                    .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                        withAnimation{showFilter.toggle()}
                    })
            )
            
        })
        
        
        
    }
}





struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



