//
//  EpochTimeConverterApp.swift
//  EpochTimeConverter
//
//  Created by Huw Williams on 27/08/2024.
//

import SwiftUI

@main
struct EpochTimeConverterApp: App {
    @StateObject var controller = HomeViewController()
    var body: some Scene {
        WindowGroup {
            DiscordScrollView()
                .environmentObject(controller)
        }
    }
}
