//
//  FirstViewController.swift
//  DelegateDemo
//
//  Created by Adriana González Martínez on 1/7/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit

//Step 4: Adopting the protocol

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "SecondViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Step 5: Creating a reference of SecondViewController specifying the delegate
        if segue.identifier == "SecondViewSegue"{
            guard let vc = segue.destination as? SecondViewController else { return }
            vc.delegate = self
        }
    }

    //Step 6: Use the method of the protocol
    
    
}

extension FirstViewController: ChangeColorProtocol {
    func didUpdateColor(color: UIColor) {
        button.setTitleColor(color, for: .normal)
    }
    
    
}
