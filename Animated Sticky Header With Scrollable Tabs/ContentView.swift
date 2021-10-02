//
//  ContentView.swift
//  Animated Sticky Header With Scrollable Tabs
//
//  Created by Yuan on 02/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            
            
            LazyVStack(alignment: .leading, spacing: 14, pinnedViews: [.sectionHeaders]) {
                
                
                Section(header: Text("Title")) {
                    
                    ForEach(foods) { food in
                        Text(food.title)
                    }
                    
                }
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
