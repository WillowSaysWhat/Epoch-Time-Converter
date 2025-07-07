//
//  DiscordScrollView.swift
//  Your Local Time
//
//  Created by Huw Williams on 07/07/2025.
//

import SwiftUI

struct DiscordScrollView: View {
    @EnvironmentObject var controller: HomeViewController
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Title
            
            VStack(spacing: controller.screenSize.height - 503) {
                ForEach(cards) { card in
                    CardView(card: card)
                        .environmentObject(controller)
                        .scrollTransition { content, phase
                            in
                            content.scaleEffect(phase.isIdentity ? 1: 0.8)
                                .blur(radius: phase.isIdentity ? 0: 10)
                                .offset(x: phase.isIdentity ? 0 : -200)
                        }
                }
            }
            .scrollTargetLayout()
            .padding(.bottom, 100)
        }
        .scrollTargetBehavior(.viewAligned)
        .overlay(georeader)
        
    }
    var georeader: some View {
        GeometryReader { proxy in
            Color.clear
                .onAppear {
                    controller.screenSize = proxy.size
                }
                .onChange(of: proxy.size) { oldValue, newValue in
                    controller.screenSize = newValue
                }
        }
    }
    var Title: some View {
        VStack(alignment: .leading) {
            Text("Discord")
                .font(.largeTitle.weight(.bold))
            Text("Formatted Timestamps")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}

#Preview {
    DiscordScrollView()
        .environmentObject(HomeViewController())
}
