//
//  App06_TODO_FirebaseApp.swift
//  App06-TODO-Firebase
//
//  Created by Carlos Astengo Macias on 07/10/21.
//

import Foundation

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}
