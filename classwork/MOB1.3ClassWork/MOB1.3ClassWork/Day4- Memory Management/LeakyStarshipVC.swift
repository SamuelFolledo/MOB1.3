//
//  LeakyStarshipVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/8/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

/*
 Day 4 Links:
    - class = https://make-school-courses.github.io/MOB-1.3-Dynamic-iOS-Apps/#/Lessons/Lesson5/README
    - Closure and Retain Cycle Article = https://www.avanderlee.com/swift/weak-self/
    - LeakyStarship repo = https://github.com/VanderDev1/LeakyStarship
    - Using the Debug Memory Graph Tool Tutorial = https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson5/Mem_Graph_Tutorial/MemGraphTutorial.md
 
 
 
 */

class LeakyStarshipVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func shipRosterBtnClicked(_ sender: Any) {
        // Call func to process crew roster
        processCrewRoster()
        
    }
    
    func processCrewRoster() {
        
        var elizabeth:Captain?
        elizabeth = Captain(name: "Queen Elizabeth I")
        
        var oprah:CrewMember? = CrewMember(name: "Oprah Winfrey", captain: elizabeth!)
        var leonardo:CrewMember? = CrewMember(name: "Leonardo Da Vinci", captain: elizabeth!)
        var hedy:CrewMember? = CrewMember(name: "Hedy Lamarr", captain: elizabeth!)
        
        elizabeth?.crewMembers = [oprah!, leonardo!, hedy!]
        
        var currentMOBClass: Starship? = Starship(name: "Make School Voyager", captain: (elizabeth?.name)!, crewMembers: ["Oprah", "Leonardo", "Hedy"])
        print("Starship's crew member roster: \(currentMOBClass!.roster())")
            
        print("-------------------------------")
        currentMOBClass = nil
        
        oprah = nil
        leonardo = nil
        hedy = nil
        elizabeth = nil
    }

    
}
