//
//  DebugSetting.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 5/23/24.
//

import Foundation

struct DebugSetting {
    let name: String
    let type: DebugSettingType
    let action: (() -> Void)
}

enum DebugSettingType {
    case boolean(Bool)
    case string(String)
}
