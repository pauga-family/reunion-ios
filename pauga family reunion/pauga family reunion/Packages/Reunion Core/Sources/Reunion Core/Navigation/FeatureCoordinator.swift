//
//  FeatureCoordinator.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/2/26.
//

import SwiftUI

/// Maps a feature's `Route` values to the View that should be displayed for them.
///
/// Each feature module owns one coordinator and registers its `CoordinatorRoute` type
/// on the app's single root `NavigationStack` via `.navigationDestination(for:)`.
/// Contract-only for now — no adopters yet.
@MainActor
public protocol FeatureCoordinator {
    associatedtype CoordinatorRoute: Route
    associatedtype Content: View

    @ViewBuilder func view(for route: CoordinatorRoute) -> Content
}
