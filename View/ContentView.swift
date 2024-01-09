//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Dimitar Angelov on 9.01.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save (){
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving data has failed!")
        }
    }
    
    func load(){
        do{
            let url = getDocumentDirectory().appendingPathComponent("notes")
            let data = try Data(contentsOf: url)
            
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            
        }
    }
    
    var body: some View {
       NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    
                    Button {
                        guard text.isEmpty == false else { return}
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        
                        text = ""
                        
                        save()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                }//: HStack
                
                Spacer()
                
                Text("\(notes.count)")
            }//: VStack
            .navigationTitle("Notes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
