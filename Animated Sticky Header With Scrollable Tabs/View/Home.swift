//
//  Home.swift
//  Animated Sticky Header With Scrollable Tabs
//
//  Created by Yuan on 02/10/2021.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        ScrollView {
            
            
            LazyVStack(alignment: .leading, spacing: 14, pinnedViews: [.sectionHeaders]) {
                
                // Parallax Header
                
                GeometryReader { reader -> AnyView in
                    
                    let offset = reader.frame(in: .global).minY
                    
                    if -offset >= 0 {
                        DispatchQueue.main.async {
                            self.homeData.offset = -offset
                        }
                    }
                    
                    return AnyView(
                        Image("food")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                            .cornerRadius(2)
                            .offset(y: (offset > 0 ? -offset : 0))
                    )
                }
                .frame(height: 250)
                
                //Cards
                Section(header: HeaderView()) {
                    // Tab with content...
                    ForEach(tabsItems) { tab in
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text(tab.tab)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.bottom)
                                .padding(.leading)
                            
                            ForEach(tab.foods) { food in
                                CardView(food: food)
                            }
                            
                            Divider()
                                .padding(.top)
                            
                        }
                        .id(tab.tab)
                        .overlay(
                            GeometryReader { reader -> Text in
                                
                                let offset = reader.frame(in: .global).minY
                                
                                // 100 của header mặc định
                                let height = (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 100
                                
                                if -offset < height && offset > 50 && homeData.selectedTab != tab.tab {
                                    DispatchQueue.main.async {
                                        self.homeData.selectedTab = tab.tab
                                    }
                                }
                                
                                return Text("")
                            }
                        )
                        
                    }
                    
                }
                
            }
            
            
        }
        .overlay(
            Color.white
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
                .opacity(homeData.offset >= 250 ? 1 : 0)
            ,alignment: .top
        )
        .environmentObject(homeData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
