//
//  SetPasscodeState.swift
//  PasscodeLock
//
//  Created by Yanko Dimitrov on 8/28/15.
//  Copyright © 2015 Yanko Dimitrov. All rights reserved.
//

import Foundation

struct SetPasscodeState: PasscodeLockStateType {
    
    let title: String
    let description: String
    let isCancellableAction: Bool
    var isBiometricAuthAllowed: Bool = false
    
	init(title: String, description: String, allowCancellation: Bool = true) {
        
        self.title = title
        self.description = description
        self.isCancellableAction = allowCancellation
    }
    
    init(allowCancellation: Bool = true) {
		
        title = localizedStringFor("PasscodeLockSetTitle", comment: "Set passcode title")
        description = localizedStringFor("PasscodeLockSetDescription", comment: "Set passcode description")
        isCancellableAction = allowCancellation
    }
    
    func acceptPasscode(_ passcode: [String], fromLock lock: PasscodeLockType) {
        
        let nextState = ConfirmPasscodeState(passcode: passcode, allowCancellation: isCancellableAction)
        
        lock.changeStateTo(nextState)
    }
}
