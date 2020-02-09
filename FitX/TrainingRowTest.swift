//
//  TrainingRowTest.swift
//  FitX
//
//  Created by Louis Tsai on 2/9/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct TrainingRowTest: View {
    @State private var machineCode: String = ""
    @State private var weight: String = ""
    @State private var sets: String = ""
    @State private var reps: String = ""

    var body: some View {
        // TODO: make title smaller or something
        // TODO: is it possible to create a custom TextFieldStyle?
        // TODO: no easy way to chain inputs together yet?
        // https://stackoverflow.com/questions/58121756/swiftui-how-to-navigate-through-textfields-by-clicking-on-return-button-from-k
        HStack {
            TextField("Machine", text: $machineCode)
                .keyboardType(.numberPad)
                .padding()
            Spacer()

            // TODO: add unit
            TextField("Weight", text: $weight)
                .keyboardType(.decimalPad)
                .padding()
            Spacer()

            TextField("Sets", text: $sets)
                .keyboardType(.numberPad)
                .padding()
            Spacer()

            TextField("Reps", text: $reps)
                .keyboardType(.numberPad)
                .padding()
        }
        .background(primaryColor)
        .cornerRadius(10)
    }
}

struct TrainingRowTest_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TrainingRowTest()
                .environment(\.colorScheme, .dark)

            TrainingRowTest()
                .environment(\.colorScheme, .light)
        }
        .previewLayout(.fixed(width: 375, height: 100))
    }
}
