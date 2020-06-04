//
//  ContentView.swift
//  Agronomist
//
//  Created by Ryan Thally on 6/1/20.
//  Copyright © 2020 Ryan Thally. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PlantsListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Plants")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
