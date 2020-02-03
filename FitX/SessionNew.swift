//
//  SessionNew.swift
//  FitX
//
//  Created by Louis Tsai on 1/26/20.
//  Copyright © 2020 Louis Tsai. All rights reserved.
//

import SwiftUI

struct SessionNew: View {
    @State var eventsList = [Training]()
    @State private var showingDiscardAlert = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        TrainingList(trainings: dummySession.trainingList)
            .navigationBarTitle(Text("New session"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.showingDiscardAlert = true
                }, label: {
                    Text("Cancel")
                }),
                trailing: Button(action: {
                    print("save")
                }, label: {
                    Text("Save")
                }))
            .alert(isPresented: $showingDiscardAlert) {
                Alert(
                    title: Text("Discard everything?"),
                    primaryButton: .destructive(Text("Yes"), action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) ,
                    secondaryButton: .cancel()
                )
        }
    }
}

struct SessionNew_Previews: PreviewProvider {
    static var previews: some View {
        SessionNew()
    }
}
