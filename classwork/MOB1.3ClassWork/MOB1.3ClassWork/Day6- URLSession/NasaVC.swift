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

//        fetchHeaderData()
        //TODO: Call function to fetch image data here
        self.navigationController?.title = "NASA Daily Picture"
        fetchDailyImageUrl()
//        fetchNasaDailyImage()
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

    func fetchDailyImageUrl() {
        //        https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY
        //TODO: Create session configuration here
        let defaultSession = URLSession(configuration: .default)
        
        //TODO: Create URL (...and send request and process response in closure...)
        if let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY") {
            
            let request = URLRequest(url: url)
            
            // Create Data Task...
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                guard error == nil else {
                    print ("error: ", error!)
                    return
                }
                print("IMAGE data is: ", data!)

                do {
                    if let data = data,
                        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
                        print("JSON RESULT = ", jsonResult, "\n")
                        DispatchQueue.main.async {
                            let explanation = jsonResult["explanation"] as? String ?? ""
                            print("Explanation = ", explanation)
                            let title = jsonResult["title"] as? String ?? ""
                            print(title)
                            self.title = title
                            let hdurl = jsonResult["hdurl"] as? String ?? ""
                            self.fetchNasaDailyImage(hdurl: hdurl)
                        }
                    }
                } catch {
                    print("Error deserializing JSON: \(error)")
                }
            })
            dataTask.resume()
        }
    }
    
// CODE BASE for In-Class Activity I
    func fetchNasaDailyImage(hdurl: String) {
        
        //TODO: Create session configuration here
        let defaultSession = URLSession(configuration: .default)
        
        //TODO: Create URL (...and send request and process response in closure...)
        if let url = URL(string: hdurl) {
            
           //TODO: Create Request here
            let request = URLRequest(url: url)
            
            // Create Data Task...
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                guard error == nil else {
                    print ("error: ", error!)
                    return
                }
//                print("data is: ", data!)
//                print("response is: ", response!)
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                          //TODO: Insert downloaded image into imageView
                        self.nasaDailyImageView.image = image
                    }
                } else {
                    print("No Data fetched")
                }
            })
            dataTask.resume()
        }
    }
 
}


