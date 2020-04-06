//
//  Day3VC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/6/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class Day3VC: UIViewController {

    var counter = 0
    var label : UILabel!
    var button : UIButton!

    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetActionExample()
        notificationExample()
    }
    
//MARK: Notification
    fileprivate func notificationExample() {
        //Add observer
        NotificationCenter.default.addObserver(self, selector: #selector(receivedNotification(_:)), name: Notification.Name("receivedNotification"), object: nil)
        
        
        NotificationCenter.default.post(name: Notification.Name("receivedNotification"), object: self)
    }
    
//Removing notification
    deinit {
        print("Removed Observer")
        NotificationCenter.default.removeObserver(self, name: Notification.Name("receivedNotification"), object: nil)
    }
    
//Notification method
    @objc func receivedNotification(_ notification:Notification) {
        // Do something here
        print("Received notification")
        self.view.backgroundColor = UIColor.purple
    }
    
//MARK: Target Action
    fileprivate func targetActionExample() {
        // UI
        let view = UIView()
        view.backgroundColor = .white

        label = UILabel()

        button = UIButton(type: .system)
        button.tag = 10
        button.setTitle("Increment", for: .normal)
        button.tintColor = .systemPurple
        //Add target
        button.addTarget(self, action: #selector(updateView), for: .touchUpInside)
        view.addSubview(label)
        view.addSubview(button)

        // Layout
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            button.firstBaselineAnchor.constraint(equalTo: label.firstBaselineAnchor)
        ])

        self.view = view
    }

//Target action method
    @objc func updateView(_ sender: UIButton) {
        let otherNumber = sender.tag
        counter += otherNumber
        label.text = "Counter: \(counter)"
    }
}

