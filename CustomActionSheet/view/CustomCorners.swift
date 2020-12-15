//
//  CustomCorners.swift
//  CustomActionSheet
//
//  Created by hosam on 12/15/20.
//

import SwiftUI

struct CustomCorners: Shape {
 
    var corners:UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
    
}
