//
//  PomodoroFirstVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class PomodoroFirstVC: UIViewController {

    var completedCycles = 0
    @IBOutlet weak var messageLabel: UILabel!
    
    deinit {
        //ACTION: Remove observers
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ACTION: Add observers
       
        
    }
    
    @objc func receivedNotification(_ notification:Notification) {
        // ACTION: Update value of completed cycles
        // ACTION: Update message label
        
    }
}
