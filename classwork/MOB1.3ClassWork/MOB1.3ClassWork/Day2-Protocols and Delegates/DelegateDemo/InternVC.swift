//
//  ViewController.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/1/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class InternVC: UIViewController {

    @IBOutlet weak var selectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func requestTask(_ sender: Any) {
        let bossVC = storyboard?.instantiateViewController(withIdentifier: "BossVC") as! BossVC
        bossVC.selectionDelegate = self
        present(bossVC, animated: true, completion: nil)
    }
    
}

extension InternVC: TaskSelectionProtocol{
    func didSelectTask(task: String) {
        self.selectionLabel.text = "Working on \(task)"
    }
}
