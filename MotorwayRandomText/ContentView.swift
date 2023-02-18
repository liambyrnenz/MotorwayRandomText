//
//  ContentView.swift
//  MotorwayRandomText
//
//  Created by Liam on 18/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RandomTextView(
            // TODO: does this need to be provided in a neater way?
            viewModel: RandomTextViewModel(
                textRepository: TextRepository()
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
