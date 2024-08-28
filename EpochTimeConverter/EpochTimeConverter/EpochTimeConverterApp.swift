//
//  EpochTimeConverterApp.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import SwiftUI
import TipKit
@main
struct EpochTimeConverterApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .task {
                    try? Tips.configure([
                        .datastoreLocation(.applicationDefault)])
                }
                
        }
    }
}
