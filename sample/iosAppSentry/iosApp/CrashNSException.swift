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

class SentryCrashHandler: CrashkiosCrashHandler {
    override func crashParts(
        addresses: [KotlinLong],
        exceptionType: String,
        message: String) {
        let clsStackTrace = addresses.map {
            let frame = Frame()
            let hexaddr = String(format:"0x%08X", UInt(truncating: $0))
//            frame.symbolAddress = hexaddr
            frame.instructionAddress = hexaddr
//            frame.imageAddress = hexaddr
            print("hex \(hexaddr)")
            return frame
        } as [Frame]

        let stacktrace = Stacktrace(frames: clsStackTrace, registers: [:])
        
        let event = Event(level: .error)
        event.message = "From CrashKiOS"
        event.stacktrace = stacktrace
        Client.shared?.send(event: event)
        
//        Crashlytics.sharedInstance().recordCustomExceptionName(
//            exceptionType,
//            reason: message,
//            frameArray: clsStackTrace
//        )
    }
}
