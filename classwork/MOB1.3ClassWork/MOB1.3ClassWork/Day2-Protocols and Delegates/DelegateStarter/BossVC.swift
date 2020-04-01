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
    
//    var selectionDelegate: TaskSelectionProtocol! //need for delegate & protocol
    public var buttonAction: ((String?) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func newFeatureSelected(_ sender: Any) {
//        selectionDelegate.didSelectTask(task: "New Feature") //need for delegate & protocol
//        dismiss(animated: true, completion: nil) //need for delegate & protocol
        update(text: "New Feature")
    }
    
    @IBAction func bugFixSelected(_ sender: Any) {
//        selectionDelegate.didSelectTask(task: "Bug Fix") //need for delegate & protocol
//        dismiss(animated: true, completion: nil) //need for delegate & protocol
        update(text: "Bug Fix")
    }
    
///the completion handler way of passing data from BossVC back to the InternVC
    func update(text: String) {
        guard let buttonAction = buttonAction else { //check if we have a buttonAction beause it is optional
            return dismiss(animated: true, completion: nil) //if no buttonAction, then just dismiss
        }
        buttonAction(text) //sends the string
    }

}
