//
//  AppManager.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import UIKit

//Singleton class managing app requirements
class AppManager {
static let shared = AppManager()
    init() {
        var style = ToastStyle()
        style.titleAlignment = .center
        ToastManager.shared.style = style
        ToastManager.shared.isTapToDismissEnabled = true
        ToastManager.shared.isQueueEnabled = true
    }
    
    static func showToast(msg: String, title: String?) {
        let view = UIApplication.topViewController()?.view
        view?.hideAllToasts()
        view?.makeToast(msg, duration: 2.0, position: .bottom, title: title)
    }
}
