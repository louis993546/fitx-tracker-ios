//
//  EventList.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct EventList: View {
    let events: [Training]
    
    var body: some View {
        List {
            ForEach(events, id: \.name) { event in
                EventRow()
            }
            Text("extra")
        }
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList(events: dummySession.trainingList)
    }
}
