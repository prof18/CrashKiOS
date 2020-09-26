//
//  CrashNSException.swift
//  iosApp
//
//  Created by Kevin Galligan on 10/10/19.
//  Copyright © 2019 Kevin Galligan. All rights reserved.
//

import Foundation
import sample
import Sentry

class CrashNSException: NSException {
    init(callStack:[NSNumber], exceptionType: String, message: String) {
        super.init(name: NSExceptionName(rawValue: exceptionType), reason: message, userInfo: nil)
        self._callStackReturnAddresses = callStack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var _callStackReturnAddresses: [NSNumber] = []
    override var callStackReturnAddresses: [NSNumber] {
        get {
            print("Getting call stack")
            return _callStackReturnAddresses
        }
        set {
            print("Setting call stack")
            _callStackReturnAddresses = newValue
            
        }
    }
}

class SentryCrashHandler: CrashkiosCrashHandler {
    override func crashParts(addresses: [KotlinLong], exceptionType: String, message: String) {
        SentrySDK.capture(exception: CrashNSException(callStack: addresses, exceptionType: exceptionType, message: message))
    }
}
