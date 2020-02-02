//
//  SessionDetail.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct SessionDetail: View {
    let session: Session
    
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .navigationBarTitle("test")
        }
    }
}

struct SessionDetail_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetail(session: dummySession)
    }
}
