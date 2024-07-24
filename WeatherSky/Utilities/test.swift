//
//  test.swift
//  WeatherSky
//
//  Created by Aysema Çam on 23.07.2024.
//

import SwiftUI

struct exx: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
        }
        Button(action: {
            count += 1
        }) {
            Text("test")
        }
    }
}
//another example

struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
                .font(.largeTitle)
            
            Button(action: {
                count += 1
            }) {
                Text("Increment")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}


struct ParentView: View {
    @State private var isOn = false

    var body: some View {
        VStack {
            Toggle("something", isOn: $isOn)
                .padding()
            
            ChildView(isOn: $isOn)
        }
    }
}
#Preview {
    ParentView()
}

struct ChildView: View {
    @Binding var isOn: Bool

    var body: some View {
        Text(isOn ? "On" : "Off")
            .font(.largeTitle)
            .padding()
            .background(isOn ? Color.green : Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct FormView: View {
    @State private var name: String = ""
    @State private var age: String = ""

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()
                .border(Color.gray)
            
            TextField("Age", text: $age)
                .padding()
                .border(Color.gray)
                .keyboardType(.numberPad)
            
            Button(action: {
                submitForm()
            }) {
                Text("Submit")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func submitForm() {
        print("Name: \(name), Age: \(age)")
    }
}
