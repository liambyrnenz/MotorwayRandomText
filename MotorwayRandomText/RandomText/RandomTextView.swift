//
//  RandomTextView.swift
//  MotorwayRandomText
//
//  Created by Liam on 18/02/23.
//

import SwiftUI

struct RandomTextView: View {
    @StateObject var viewModel: RandomTextViewModel
    
    var header: some View {
        VStack(alignment: .leading) {
            Text(Strings.RandomText.heading)
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 2)
            Text(Strings.RandomText.description)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var generateButton: some View {
        Button(Strings.RandomText.Actions.generate) {
            viewModel.updateRandomText()
        }
        .buttonStyle(.borderedProminent)
//        .tint(.black)
    }
    
    var textArea: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.primary, lineWidth: 2)
                TextEditor(text: $viewModel.text)
                    .scrollContentBackground(.hidden)
                    .padding()
            }
            .padding(.top)
            Text(Strings.RandomText.Dynamic.characterCount(viewModel.text.count))
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    var body: some View {
        VStack {
            header
            generateButton
            textArea
        }
        .padding(24)
        .background(.blue.opacity(0.2))
    }
}

struct RandomTextView_Previews: PreviewProvider {
    static var previews: some View {
        RandomTextView(
            viewModel: RandomTextViewModel()
        )
    }
}
