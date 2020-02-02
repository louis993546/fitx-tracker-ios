//
//  DummyData.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import Foundation

let dummySession = Session(
    id: 1,
    startTime: Date(),
    endTime: Date(),
    trainingList: [
        WeightMachineTraining(
            weightMachine: WeightMachine.bicepCurl,
            weight: 10,
            sets: 3,
            reps: 12
        )
    ]
)
