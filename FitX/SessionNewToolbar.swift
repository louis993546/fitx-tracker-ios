//
//  SessionNewToolbar.swift
//  FitX
//
//  Created by Louis Tsai on 2/9/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import Foundation
import SwiftUI

struct SessionNewToolbar: View {
    // TODO: send in callbacks
    let onMoveUpClicked: () -> Void
    let onMoveDownClicked: () -> Void
    let onAddClicked: () -> Void
    let onEditClicked: () -> Void

    var body: some View {
        VStack {
            // TODO: divider
            HStack {
                Button(
                    action: { self.onMoveUpClicked() },
                    label: { Image(systemName: "arrow.up")
                        .font(.system(size: 22))

                }
                )
                Spacer()

                Button(
                    action: { self.onEditClicked() },
                    label: {
                        Image(systemName: "pencil").font(.system(size: 22))
                }
                )
                Spacer()

                Button(
                    action: { self.onAddClicked() },
                    label: { Image(systemName: "plus")
                        .font(.system(size: 22))

                }
                )
                Spacer()

                Button(
                    action: { self.onMoveUpClicked() },
                    label: {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 22))

                }
                )
            }
            .padding()
            .background(toolbarColorLight)
        }
    }
}

struct SessionNewToolbar_Previews: PreviewProvider {
    static var previews: some View {
        SessionNewToolbar(
            onMoveUpClicked: {},
            onMoveDownClicked: {},
            onAddClicked: {},
            onEditClicked: {}
        )
            .previewLayout(.fixed(width: 375, height: 50))
    }
}
