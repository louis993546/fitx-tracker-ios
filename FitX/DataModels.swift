//
//  DataModels.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import Foundation
import RealmSwift

class SessionData: Object {
    @objc dynamic var id = 0
    @objc dynamic var startTime: Date?
    @objc dynamic var endTime: Date?
    let trainings = List<TrainingData>()
}

enum TrainingType: String {
    case Placeholder
    case WeightMachine
    case RowingMachine
}

// Everything needs to be optional -_-
class TrainingData: Object {
    @objc dynamic var type = TrainingType.Placeholder.rawValue

    // common data
    let attachments = List<String>()
    let heartRate = RealmOptional<Int>()

    // weight machine
    let weightMachineCode = RealmOptional<Int>()
    let weight = RealmOptional<Float>()
    let reps = RealmOptional<Int>()
    let sets = RealmOptional<Int>()

    // rowing machine
    let distance = RealmOptional<Float>()
    let duration = RealmOptional<TimeInterval>()    // TODO does it work like this?
    let rating = RealmOptional<Int>()
    let resistance = RealmOptional<Int>()

    // add more here
}
