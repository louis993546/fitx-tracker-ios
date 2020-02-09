//
//  TrainingList.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct TrainingList: View {
    let trainings: [Training]

    var body: some View {
        List {
            ForEach(trainings, id: \.name) { _ in
                TrainingRow(inFocus: false)
            }
//            TrainingRow(inFocus: false)
            TrainingRowTest()
        }
        .onAppear(perform: { UITableView.appearance().separatorStyle = .none })
        .onDisappear(perform: {
            UITableView.appearance().separatorStyle = .singleLine
        })
    }
}

struct TrainingList_Previews: PreviewProvider {
    static var previews: some View {
        TrainingList(trainings: dummySession.trainingList)
    }
}
