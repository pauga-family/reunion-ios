//
//  NavigationContext.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 12/10/24.
//

import Foundation
import SwiftUI

protocol NavigationContext {
    func setInitialView<T: View>(view: T)
    func push<T: View>(view: T, animated: Bool)
    func pop(animated: Bool)
    func present<T: View>(view: T, animated: Bool)
    func dismiss(animated: Bool)
}
