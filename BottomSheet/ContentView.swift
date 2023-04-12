//
//  ContentView.swift
//  BottomSheet
//
//  Created by Muhammed Faruk Söğüt on 12.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isSheetPresented: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isSheetPresented.toggle()
            } label: {
                Text("Open Sheet")
                    .padding()
            }

        }
        .padding()
        .halfSheet(isPresented: $isSheetPresented) {
            ZStack {
                Color.mint
                Text("Hello")
                    .foregroundColor(.black)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
