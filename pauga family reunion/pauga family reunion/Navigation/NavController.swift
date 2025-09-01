//
//  NavController.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 12/10/24.
//

import Foundation
import UIKit
import SwiftUI

class NavController : UINavigationController, NavigationContext {
    func setInitialView<T: View>(view: T) {
        let vc = UIHostingController(rootView: view)
        viewControllers = [vc]
    }
    
    func push<T: View>(view: T, animated: Bool) {
        let vc = UIHostingController(rootView: view)
        pushViewController(vc, animated: animated)
    }
    
    func pop(animated: Bool) {
        popViewController(animated: animated)
    }
    
    func present<T: View>(view: T, animated: Bool) {
        let vc = UIHostingController(rootView: view)
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .automatic
        present(vc, animated: animated)
    }
    
    func dismiss(animated: Bool) {
        self.viewControllers.removeLast()
    }
}
