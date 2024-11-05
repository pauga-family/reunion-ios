//
//  DebugHelpers.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 5/23/24.
//

import Foundation

let userLoginSetting: DebugSetting = DebugSetting(
    name: "Log User In",
    type: DebugSettingType.boolean(false),
    action: {UserService.shared})
