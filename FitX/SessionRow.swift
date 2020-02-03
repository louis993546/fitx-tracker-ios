//
//  SessionRow.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct SessionRow: View {
    var session: Session
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }()

    var body: some View {
        HStack {
            VStack(alignment: HorizontalAlignment.leading) {
//                if session.startTime.isSameDayAs(other: session.endTime) {
//                    Text("\(session.startTime, formatter: Self.dateFormatter)")
//                        .font(.headline)
//                } else {
//                    Text("\(session.startTime, formatter: Self.dateFormatter) - \(session.endTime, formatter: Self.dateFormatter)")
//                        .font(.headline)
//                }
                Text(session.getReadableTitle())
                    .font(.headline)
                // TODO singular or plural
                Text("\(session.trainingList.count) events")
            }
            Spacer()
        }
    }
}

struct SessionRow_Previews: PreviewProvider {
    static var previews: some View {
        SessionRow(session: dummySession)
            .previewLayout(.fixed(width: 375, height: 100))
    }
}

extension Date {
    public static let dateCheckerFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }()

    func isSameDayAs(other: Date) -> Bool {
        let this = "\(Date.dateCheckerFormatter.string(from: self))"
        let that = "\(Date.dateCheckerFormatter.string(from: other))"
        return this == that
    }
}
