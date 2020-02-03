//
//  Models.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import Foundation

struct Session: Identifiable {
    var id: Int
    var startTime: Date
    var endTime: Date
    var trainingList: [Training]

    func getReadableTitle() -> String {
        if startTime.isSameDayAs(other: endTime) {
            return Date.dateCheckerFormatter.string(from: startTime)
        } else {
            return "\(Date.dateCheckerFormatter.string(from: startTime)) - \(Date.dateCheckerFormatter.string(from: endTime))"
        }
    }
}

// Session will have a series of events
// And event can be many different things: a workout, start time, pause, etc.
// TODO I guess attachment belongs here?
protocol Training {
    var name: String { get }
}

enum WeightMachine: Int {
    case chessPress = 1
    case chessCompress = 2
    case lowPull = 3
    case reverseButterfly = 4
    case shoulderPull = 5
    case shoulderPress = 6
    case legPress = 7
    case thigh = 8
    case innerThigh = 9
    case lowerBack = 13
    case quads = 18
    case bicepCurl = 22
    case tricep = 23
    case stomechCurl = 24
}

enum CardioMachine {
    case rowing
    case treadmill
}

struct WeightMachineTraining: Training {
    var weightMachine: WeightMachine
    var weight: Float
    var sets: Int
    var reps: Int

    var name: String {
        return "\(weightMachine): \(weight)kg, \(sets)x\(reps)"
    }
}

struct RowingMachineTraining: Training {
    var distance: Float
    var duration: TimeInterval
    var rating: Int
    var resistance: Int
    var averageHeartRate: Int?

    var name: String {
        return "\(distance)m, \(duration), rating \(rating)"
    }
}

struct UnknownTraining: Training {
    var data: String
    var name: String {
        return data
    }
}
