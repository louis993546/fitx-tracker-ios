//
//  SessionNew.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct SessionNew: View {
    @State private var focusIndex = 0
    @State private var trainingList = [Training]()
    @State private var showingDiscardAlert = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            TrainingList(trainings: trainingList)
                .navigationBarTitle(Text("New session"), displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action: {
                        self.showingDiscardAlert = true
                        print("done")
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }),
                    trailing: Button(action: { print("save") }, label: {
                        Text("Save")
                    })
            )
                .alert(isPresented: $showingDiscardAlert) {
                    Alert(
                        title: Text("Discard everything?"),
                        primaryButton: .destructive(Text("Yes"), action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }),
                        secondaryButton: .cancel()
                    )
            }
            
            SessionNewToolbar(
                onMoveUpClicked: {
                    if self.focusIndex > 0 {
                        self.focusIndex -= 1
                    }
            },
                onMoveDownClicked: {
                    if self.focusIndex < self.trainingList.count - 1 {
                        self.focusIndex += 1
                    }
            },
                onAddClicked: {
                    // TODO:
            },
                onEditClicked: {
                    // TODO:
            }
            )
        }
    }
}

struct SessionNew_Previews: PreviewProvider {
    static var previews: some View {
        SessionNew()
    }
}
