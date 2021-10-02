//
//  CardView.swift
//  Animated Sticky Header With Scrollable Tabs
//
//  Created by Yuan on 02/10/2021.
//

import SwiftUI

struct CardView: View {
    
    var food: Food
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(food.title)")
                    .font(.title2)
                
                Text("\(food.description)")
                    .font(.caption)
                    .lineLimit(3)
                
                Text(food.price)
                    .fontWeight(.bold)
            }
            Spacer(minLength: 10)
            
            Image(food.image)
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 130)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
