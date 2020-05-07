//
//  LoginVC.swift
//  Moviefy
//
//  Created by Macbook Pro 15 on 5/4/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let api = MovieDB.api
        api.send(request: .getToken(completion: { (result) in
            switch result {
            case .success(let result):
                print("GETOKEN result=", result)
                if result.success {
                    //begin authentication
                }
                //                print(page.results)
//                self.movies = page.results
//                var basicSection = MovieSection()
//                basicSection.numberOfItems = self.movies.count
//                basicSection.items = page.results
//                self.sections.append(TitleSection(title: "Now Trending"))
//                self.sections.append(basicSection)
//                self.setupCollectionView()
            case .failure(let error):  print(error)
            }
        }))
//        api.send(request: .popularMovies(completion: { result in
//            switch result {
//            case .success(let page):
//                //                print(page.results)
//                self.movies = page.results
//                var basicSection = MovieSection()
//                basicSection.numberOfItems = self.movies.count
//                basicSection.items = page.results
//                self.sections.append(TitleSection(title: "Now Trending"))
//                self.sections.append(basicSection)
//                self.setupCollectionView()
//            case .failure(let error):  print(error)
//            }
//        }))
    }
}
