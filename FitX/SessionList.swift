//
//  SessionList.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI
import RealmSwift

struct SessionList: View {
    @EnvironmentObject var sessions: ObservableSessionData

    var body: some View {
        NavigationView {
            VStack {
                List(sessions.sessions) { session in
                    NavigationLink(destination: SessionDetail(session: session)) {
                        SessionRow(session: session)
                    }
                }
                .navigationBarTitle(Text("Sessions"))
                .navigationBarItems(
                    leading: Button(
                        action: {
                            let realm = try! Realm()
                            try! realm.write { realm.deleteAll() }
                    },
                        label: {
                            Text("clear all data")
                    }
                    )
                )

                HStack {
                    Text("Last workout: _d")
                        .font(.footnote)
                    Spacer()
                    NavigationLink(destination: SessionNew(), label: {
                        Image(systemName: "square.and.pencil")
                    })
                }.padding()
            }
        }
    }
}

struct SessionList_Previews: PreviewProvider {
    static var previews: some View {
        SessionList()
            .environmentObject(ObservableSessionData())
    }
}
