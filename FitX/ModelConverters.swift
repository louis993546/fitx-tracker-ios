//
//  ModelConverters.swift
//  FitX
//
//  Created by Louis Tsai on 2/2/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import Foundation
import RealmSwift

func convert(data: List<TrainingData>) -> [Training] {
    return data.map { td in
        switch TrainingType(rawValue: td.type) {
        case .Placeholder:
            return UnknownTraining(data: "placeholder")
        case .RowingMachine:
            return try! td.toRowingMachineTraining()
        case .WeightMachine:
            return try! td.toWeightMachineTraining()
        default:
            return UnknownTraining(data: "Unknown type '\(td.type)'")
        }
    }
}

enum TrainingDataError: Error {
    case mismatchType(expect: String, instead: String)
}

extension TrainingData {
    func toWeightMachineTraining() throws -> WeightMachineTraining {
        guard self.type == TrainingType.WeightMachine.rawValue else {
            throw TrainingDataError.mismatchType(
                expect: TrainingType.WeightMachine.rawValue,
                instead: self.type
            )
        }
        
        return WeightMachineTraining(
            weightMachine: WeightMachine(rawValue: self.weightMachineCode.value!)!,
            weight: self.weight.value!,
            sets: self.sets.value!,
            reps: self.reps.value!
        )
    }
    
    func toRowingMachineTraining() throws -> RowingMachineTraining {
        guard self.type == TrainingType.RowingMachine.rawValue else {
            throw TrainingDataError.mismatchType(
                expect: TrainingType.RowingMachine.rawValue,
                instead: self.type
            )
            
        }
        return RowingMachineTraining(
            distance: self.distance.value!,
            duration: self.duration.value!,
            rating: self.rating.value!,
            resistance: self.resistance.value!,
            averageHeartRate: self.heartRate.value
        )
    }
}

extension SessionData {
    func toSession() -> Session {
        return Session(
            id: self.id,
            startTime: self.startTime!,
            endTime: self.endTime!,
            trainingList: convert(data: self.trainings)
        )
    }
}
