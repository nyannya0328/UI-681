//
//  CustomModifier.swift
//  UI-681
//
//  Created by nyannyan0328 on 2022/09/27.
//

import SwiftUI

extension View{
    
    @ViewBuilder
    func offset(competion : @escaping(CGRect)->())->some View{
        
        self
            
            .overlay {
                
                GeometryReader{proxy in
                    
                    let rect = proxy.frame(in: .named("SCROLLER"))
                    
                    
                    Color.clear
                        .preference(key :OffsetKey.self, value: rect)
                        .onPreferenceChange(OffsetKey.self) { value in
                            
                            competion(value)
                        }
                    
                    
                }
                
            }
        
        
        
        
    }
    
    
}

struct OffsetKey : PreferenceKey{
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        
        value =  nextValue()
    }
    
}
