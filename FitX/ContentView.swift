//
//  ContentView.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    var testSession = dummySession
    var body: some View {
        SessionList()
            .environmentObject(ObservableSessionData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
