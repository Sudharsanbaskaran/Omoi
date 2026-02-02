//
//  LaunchView.swift
//  Omoi
//
//  Created by Sudharsan Baskaran on 10/11/25.
//

import SwiftUI

enum Route: Hashable {
    case home
}

struct ContentView: View {
    @State private var path = [Route]()

    var body: some View {
            NavigationStack(path: $path) {
            ZStack {
                Color(red: 247 / 255, green: 233 / 255, blue: 212 / 255)
                    .ignoresSafeArea()

                VStack(spacing: 10) {
                    Image("onboardingPageImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 323.77, height: 339.11)

                    VStack(alignment: .leading, spacing: 20) {
                        Text("Omoi.")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(Color(red: 198 / 255, green: 112 / 255, blue: 72 / 255))

                        Text("“Your emotions, your space”")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 25, weight: .semibold))
                            .foregroundColor(Color(red: 187 / 255, green: 159 / 255, blue: 82 / 255))

                        Text("A clean, peaceful journal to hold your moods and memories")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color(red: 90 / 255, green: 70 / 255, blue: 61 / 255))
                    }

                    Spacer()
                        .frame(height: 10)

                    Button("Start") {
                        path.append(.home)
                    }
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color(red: 187 / 255, green: 159 / 255, blue: 82 / 255))
                    .frame(width: 153, height: 44)
                    .background(Color(red: 198 / 255, green: 112 / 255, blue: 72 / 255))
                    .cornerRadius(24)
                }
                .padding()

                NavigationLink(value: Route.home) {
                    EmptyView()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .home:
                    HomeView()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
