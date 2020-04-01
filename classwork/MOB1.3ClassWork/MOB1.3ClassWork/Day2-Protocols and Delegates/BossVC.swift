//
//  BossVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/1/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

protocol TaskSelectionProtocol {
    func didSelectTask(task: String)
}

class BossVC: UIViewController {
    
    var selectionDelegate: TaskSelectionProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func newFeatureSelected(_ sender: Any) {
        selectionDelegate.didSelectTask(task: "New Feature")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bugFixSelected(_ sender: Any) {
        selectionDelegate.didSelectTask(task: "Bug Fix")
        dismiss(animated: true, completion: nil)
    }

}
