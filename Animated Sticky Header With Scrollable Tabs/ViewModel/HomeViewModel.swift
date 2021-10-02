//
//  HomeViewModel.swift
//  Animated Sticky Header With Scrollable Tabs
//
//  Created by Yuan on 02/10/2021.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var offset: CGFloat = .zero
    
    @Published var selectedTab: String = tabsItems.first!.tab
}
