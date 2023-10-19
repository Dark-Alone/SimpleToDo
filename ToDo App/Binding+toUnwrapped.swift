//
//  Binding+Wrapped.swift
//  ToDo App
//
//  Created by Марк Акиваев on 10/19/23.
//

import SwiftUI

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
