//
//  SessionNew.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct SessionNew: View {
    var body: some View {
        // TODO I guess eventList should not take anything in this case?
        EventList(events: dummySession.trainingList)
    }
}

struct SessionNew_Previews: PreviewProvider {
    static var previews: some View {
        SessionNew()
    }
}
