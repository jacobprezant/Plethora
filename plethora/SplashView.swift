//
//  SplahView.swift
//  plethora
//
//  Created by Jacob Prezant on 6/1/25.
//

import SwiftUI

struct SplashView: View {
    @State private var showMain = false

    var body: some View {
        Group {
            if showMain {
                ContentView()
            } else {
                VStack(spacing: 24) {
                    Link(destination: URL(string: "https://github.com/jacobprezant/plethora")!) {
                        Text("Plethora")
                            .font(.largeTitle)
                            .bold()
                    }
                }
                .multilineTextAlignment(.center)
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            showMain = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
