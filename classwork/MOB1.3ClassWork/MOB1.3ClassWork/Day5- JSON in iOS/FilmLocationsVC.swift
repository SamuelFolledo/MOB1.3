//
//  FilmLocationsVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/13/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class FilmLocationsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var films:[FilmEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    fileprivate func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFile("locations")
    }
    
    //method name suggestion
    func getDataFromFile(_ fileName: String){
        let path = Bundle.main.path(forResource: fileName, ofType: ".json")
        if let path = path {
          let url = URL(fileURLWithPath: path)
          let contents = try? Data(contentsOf: url)
          do {
            if let data = contents,
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:Any]] {
                for film in jsonResult {
                    guard let film = FilmEntry(json: film) else { continue }
                    films.append(film)
                }
                tableView.reloadData()
            }
          } catch {
            print("Error deserializing JSON: \(error)")
          }
        }
    }
}

extension FilmLocationsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension FilmLocationsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        let movie = films[indexPath.row]
        cell.textLabel?.text = movie.locations
        return cell
    }
    
    
}
