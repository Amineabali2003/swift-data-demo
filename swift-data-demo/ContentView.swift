//
//  ContentView.swift
//  swift-data-demo
//
//  Created by ABALi Mohammed Amine on 04/02/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedText: String = ""
    @State private var selectedAgeText: String = ""
    
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate<Person>{person in
        person.age > 50 || person.age < 20
    }, sort: \Person.age, order: .forward) private var persons: [Person]
    
    var body: some View {
        VStack {
            List(persons) { person in
                HStack {
                    VStack(alignment: .leading) {
                        Text(person.name)
                        Text("Age: \(person.age)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .swipeActions {
                    Button(role: .destructive) {
                        context.delete(person)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            HStack{
                
                TextField("Name", text: $selectedText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Age", text: $selectedAgeText)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Add") {
                    let newPerson = Person(name: selectedText, age: Int(selectedAgeText) ?? 0)
                    context.insert(newPerson)
                    
                    selectedText = ""
                    selectedAgeText = ""
                }
                .padding()
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
