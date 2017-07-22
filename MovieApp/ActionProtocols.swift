//
//  ActionProtocols.swift
//  Conference
//
//  Created by Chetan Anand on 26/4/17.
//  Copyright © 2017 LiveLabs. All rights reserved.
//

import Foundation

// MARK: - ActionDelegate
// First we define the ActionDelegate and its action protocol once
protocol ActionType {}
typealias CompletionHandler = (_ sender : Any?,  _ success: ActionType) -> Void


protocol ActionDelegate: class {
    func onAction(_ sender: Any?, _ action: ActionType)
}

protocol ActionCompleting {
    var onCompletionAction: CompletionHandler? {get set}
}


// MARK: - Usages of ActionDelegate
/*
 
 // A view controller
 final class RedViewController: UIViewController {
 
 enum Action: ActionType {
    case close, complete
 }
 
 weak var delegate: ActionDelegate?
 
 func pressButton(sender: Any) {
 delegate?.onAction(self, didReceiveAction: Action.close)
 }
 
 }
 
 
 // Another view controller
 final class BlueViewController: UIViewController {
 
 enum Action: ActionType {
 case destroy(message: String), dismiss
 }
 
 weak var delegate: ActionDelegate?
 
 func pressButton(sender: Any) {
 delegate?.onAction(self, didReceiveAction: Action.destroy(message: "everyone"))
 }
 
 }
 
 
 // A view controller which at some points presents Red/Blue view controllers and becomes their delegate
 final class ParentViewController: UIViewController, ActionDelegate {
 
 // Some VC properties and methods...
 
 func onAction(_ sender: Any?, didReceiveAction action: ActionType) {
 switch action {
 case RedViewController.Action.close:
 print("Close red")
 case RedViewController.Action.complete:
 print("Complete red")
 case BlueViewController.Action.destroy(let message):
 print("Destroy \(message) blue")
 case BlueViewController.Action.dismiss:
 print("Destroy blue")
 default:
 print(action)
 }
 }
 
 }
 
 
 // Example of how it all fits together
 let parentVC = ParentViewController()
 
 let redVC = RedViewController()
 redVC.delegate = parentVC
 redVC.pressButton(sender: "Me") // "Close red"
 let blueVC = BlueViewController()
 blueVC.delegate = parentVC
 blueVC.pressButton(sender: "Him") // "Destroy everyone blue"
 
 */
