//
//  TrainingRow.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct TrainingRow: View {
    var inFocus: Bool

    var body: some View {
        HStack {
            Text("test").padding()
            Spacer()
        }
        .background(primaryColor)
        .cornerRadius(10)
    }
}

struct TrainingRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TrainingRow(inFocus: false)
                .environment(\.colorScheme, .dark)

            TrainingRow(inFocus: false)
                .environment(\.colorScheme, .light)
        }
        .previewLayout(.fixed(width: 375, height: 100))
    }
}
