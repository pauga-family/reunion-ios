//
//  Route.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/2/26.
//

import Foundation

/// Marker protocol for a destination a `FeatureCoordinator` can navigate to.
///
/// Conformers are typically per-feature enums (e.g. `EventsRoute`, `AuthRoute`),
/// each owned by its own feature module. `Hashable` is required so routes can be
/// appended to a SwiftUI `NavigationPath` and matched by `.navigationDestination(for:)`.
/// `Codable` is required so a `NavigationPath` built from routes can be serialized —
/// for state restoration and deep-linking.
public protocol Route: Hashable, Codable {}
