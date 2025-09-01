//
//  Coordinator.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 12/10/24.
//

import Foundation

protocol Coordinator {
    associatedtype CoordinatorRoute: Route
    func navigate(to route: CoordinatorRoute)
}

protocol Route { }
