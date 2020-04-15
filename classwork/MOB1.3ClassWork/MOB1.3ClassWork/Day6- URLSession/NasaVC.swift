//
//  NasaVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class NasaVC: UIViewController {

    @IBOutlet weak var nasaDailyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchHeaderData()
        //TODO: Call function to fetch image data here
        fetchNasaDailyImage()
    }

    //MARK: Data Fetch functions
    
    func fetchHeaderData() {
        
        let defaultSession = URLSession(configuration: .default)
        
        // Create URL
        let url = URL(string: "https://httpbin.org/headers")
        
        // Create Request
        let request = URLRequest(url: url!)
        
        // Create Data Task
        let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            print("data is: ", data!)
            print("response is: ", response!)
            
        })
        dataTask.resume()
    }

    
// CODE BASE for In-Class Activity I
    func fetchNasaDailyImage() {
        
        //TODO: Create session configuration here
        let defaultSession = URLSession(configuration: .default)
        
        //TODO: Create URL (...and send request and process response in closure...)
        if let url = URL(string: "https://apod.nasa.gov/apod/image/2004/MVP_Aspinall_2048.jpg") {
            
           //TODO: Create Request here
            let request = URLRequest(url: url)
            
            // Create Data Task...
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                guard error == nil else {
                    print ("error: ", error!)
                    return
                }
                
                guard data != nil else {
                      print("No data object")
                      return
                }
                print("data is: ", data!)
                print("response is: ", response!)
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        
                          //TODO: Insert downloaded image into imageView
                        self.nasaDailyImageView.image = image
                    }
                }
            })
            dataTask.resume()
        }
    }
 
}


