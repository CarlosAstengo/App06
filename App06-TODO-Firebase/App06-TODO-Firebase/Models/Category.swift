//
//  App06_TODO_FirebaseApp.swift
//  App06-TODO-Firebase
//
//  Created by Carlos Astengo Macias on 07/10/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Category: Identifiable, Codable {
    
    @DocumentID var id: String?
    var category_id: String
    var category: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case category_id
        case category
        case image
    }
    
}
