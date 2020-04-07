//
//  PomodoroFirstVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

let kPOMODORONOTIFICATION: String = "pomodoroNotification"

class PomodoroFirstVC: UIViewController {

    var completedCycles = 0
    @IBOutlet weak var messageLabel: UILabel!
    
    deinit {
        //ACTION: Remove observers
       NotificationCenter.default.removeObserver(self, name: Notification.Name(kPOMODORONOTIFICATION), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ACTION: Add observers
       setupObserver()
    }
    
    fileprivate func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(pomodoroUpdated(_:)), name: Notification.Name(kPOMODORONOTIFICATION), object: nil)
    }
    
    @objc func pomodoroUpdated(_ notification:Notification) {
        // ACTION: Update value of completed cycles
        completedCycles += 1
        // ACTION: Update message label
        messageLabel.text = String(completedCycles) + " pomodoro cycles completed today"
    }
}
