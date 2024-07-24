//
//  WeatherTopPart.swift
//  WeatherSky
//
//  Created by Aysema Çam on 18.07.2024.
//

import SwiftUI

struct WeatherTopPart: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Button(action: {
            
            }) {
                Image(systemName: "square.stack.3d.up")
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
            Spacer()
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(4)
                TextField("Search", text: $searchText)
                    .foregroundColor(.white)
                    .frame(height: 36)
                    .opacity(0.8)

            }
            .padding(0)
            .background(Color.clear)
         
            .border(.white.opacity(0.5), width: 1.5)
            .cornerRadius(5)
            Spacer()
            Button(action: {
               
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
        }
        .padding(.horizontal)
    }
}
