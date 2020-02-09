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
                    }) {
                        Text("clear all data")
                    },
                    trailing: Button(action: {
                        let realm = try! Realm()
                        try! realm.write {
                            let dummyData = SessionData()
                            let now = Date()
                            var aWhileAgo = Date()
                            aWhileAgo.addTimeInterval(-3600)
                            dummyData.endTime = now
                            dummyData.startTime = aWhileAgo
                            realm.add(dummyData)
                        }
                    }) {
                        Text("Add dummy item")
                    }
                )
                
                HStack {
                    if self.test() != nil {
                        Text("Last workout: \(self.test()!)")
                            .font(.footnote)
                    }
                    Spacer()
                    NavigationLink(destination: SessionNew(), label: {
                        Image(systemName: "square.and.pencil")
                        .accessibility(hint: Text("Add new session"))
                    })
                }.padding()
            }
            
            
        }
    }
    
    // TODO: there's got to be a better way to do this
    
    func test() -> String? {
        let x = sessions.sessions.first
        let startDate = x?.startTime
        
        if startDate != nil {
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            return df.string(from: startDate!)
        } else {
            return nil
        }
        
    }
}

struct SessionList_Previews: PreviewProvider {
    static var previews: some View {
        SessionList()
            .environmentObject(ObservableSessionData())
    }
}
