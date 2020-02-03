//
//  TrainingRow.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct EventRow: View {
    var body: some View {
        HStack {
            Text("test")
                .padding()
            Spacer()
        }
        .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
        .cornerRadius(10)
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow()
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
