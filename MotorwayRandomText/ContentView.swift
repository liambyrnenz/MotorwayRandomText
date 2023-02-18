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
            viewModel: RandomTextViewModel()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
