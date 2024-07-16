//
//  ContentView.swift
//  Rooms
//
//  Created by Mustafa TAVASLI on 16.07.2024.
//

import SwiftUI
import SwiftData

struct UIColorSelector : View {
    
    @Binding var selection : Color
    let colors : [Color] = [.red, .orange, .purple, .blue, .yellow, .indigo]
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .fill(color)
                    .overlay(selection == color ? Circle().stroke(Color.black, lineWidth: 2) : nil)
                    .onTapGesture {
                        selection = color
                    }
            }
        }
    }
}

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var rooms : [Room] = []
    
    @State private var name : String = ""
    @State private var color : Color = .red
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            
            UIColorSelector(selection: $color)
            
            Button {
                let room = Room(name: name, color: UIColor(color))
                context.insert(room)
                name = ""
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }.buttonStyle(.borderedProminent)
                .padding([.top], 20)
            
            List(rooms) { room in
                HStack {
                    Text(room.name)
                    Spacer()
                    Rectangle()
                        .fill(Color(uiColor: room.color))
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Room.self], inMemory: true)
}
