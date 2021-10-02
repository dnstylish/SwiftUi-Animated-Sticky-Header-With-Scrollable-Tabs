//
//  HeaderView.swift
//  Animated Sticky Header With Scrollable Tabs
//
//  Created by Yuan on 02/10/2021.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 0) {
                // back button
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: getSize(), height: getSize())
                        .foregroundColor(.primary)
                }
                Text("BL Kabery")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            ZStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Asiatisch . Koreanisch . Japnisch")
                        .font(.caption)
                    
                    HStack(spacing: 8) {
                        
                        Image(systemName: "clock")
                            .font(.caption)
                        
                        Text("30-40 Min")
                            .font(.caption)
                        
                        Text("4.3")
                            .font(.caption)
                        
                        Image(systemName: "star.fill")
                            .font(.caption)
                        
                        Text("$6.40 Fee")
                            .font(.caption)
                            .padding(.leading, 10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .opacity(homeData.offset > 200 ? 1 - Double((homeData.offset - 200) / 50) : 1)
                // Custom ScrollView
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(tabsItems) { tab in
                                
                                Text(tab.tab)
                                    .font(.caption)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(
                                        Color.primary
                                            .opacity(homeData.selectedTab == tab.tab ? 1 : 0)
                                    )
                                    .clipShape(Capsule())
                                    .foregroundColor(homeData.selectedTab == tab.tab ? .white : .primary)
                                    .id(tab.tab)
                            }
                            .onChange(of: homeData.selectedTab, perform: { value in
                                withAnimation(.easeIn) { 
                                    proxy.scrollTo(homeData.selectedTab, anchor: .leading)
                                }
                            })
                        }
                    }
                    .opacity(homeData.offset > 200 ? Double((homeData.offset - 200) / 50) : 0)
                }
            }
            .frame(height: 60)
            
            
            if homeData.offset > 250 {
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(Color.white)
    }
    
    // Get Size Button and animation
    
    func getSize() -> CGFloat {
        if homeData.offset > 200 {
            let process = (homeData.offset - 200) / 50
            if process < 1 {
                return process * 40
            } else {
                return 40
            }
        } else {
            return 0
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
