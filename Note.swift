//
//  Note.swift
//  Notes Watch App
//
//  Created by Dimitar Angelov on 9.01.24.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
