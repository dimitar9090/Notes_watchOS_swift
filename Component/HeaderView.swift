//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Dimitar Angelov on 13.01.24.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String = ""
    var body: some View {
        VStack {
            
            if title != ""{
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            HStack{
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }//:HStack
            .foregroundColor(.accentColor)
        }//:VStack
    }
}

struct HeaderView_Previws: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            HeaderView()
        }
    }
}
