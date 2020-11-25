//
//  CardView.swift
//  CustomActionSheet
//
//  Created by Hossam on 11/25/20.
//

import SwiftUI


struct CardView:View {
    @State var filter:Filter
    
    var body: some View {
        
        HStack {
            
            Text(filter.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.black.opacity(0.7))
            
            Spacer()
            
            ZStack {
                
                Circle()
                    .stroke(filter.checked ? Color.blue :  Color.gray,lineWidth: 1)
                    .frame(width: 25, height: 25)
                
                if filter.checked {
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.blue)
                    
                }
            }
            
        }
        .padding(.horizontal)
        .clipShape(Rectangle())
        .onTapGesture(perform: {
            filter.checked.toggle()
        })
    }
    
}
