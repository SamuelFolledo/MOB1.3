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
    
    var films: [FilmEntryCodable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    fileprivate func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFileUsingCodable("locations")
    }
    
    //method name suggestion
    func getDataFromFile(_ fileName: String) {
        let path = Bundle.main.path(forResource: fileName, ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            let contents = try? Data(contentsOf: url)
            do {
                if let data = contents,
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:Any]] {
                    //              print(jsonResult)
                    for film in jsonResult {
                        //                    let firstActor = film["actor_1"] as? String ?? ""
                        //                    let locations = film["locations"] as? String  ?? ""
                        //                    let releaseYear = film["release_year"] as? String  ?? ""
                        //                    let title = film["title"] as? String  ?? ""
                        //                    let movie = FilmEntry(firstActor: firstActor, locations: locations, releaseYear: releaseYear, title: title)
//                        guard let film = FilmEntry(json: film) else { continue } //using json extension
//                        films.append(film)
                    }
                    tableView.reloadData()
                }
            } catch {
                print("Error deserializing JSON: \(error)")
            }
        }
    }
    
    func getDataFromFileUsingCodable(_ fileName:String) {
        let path = Bundle.main.path(forResource: fileName, ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            let contents = try? Data(contentsOf: url)
            if let data = contents {
                let decoder = JSONDecoder()
                do {
                    let filmsFromJSON = try decoder.decode([FilmEntryCodable].self, from: data)
                    films = filmsFromJSON
                    tableView.reloadData()
                } catch {
                    print("Parsing Failed")
                }
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
//        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "locationCell") //to have detailTextLabel
        let movie = films[indexPath.row]
        cell.textLabel?.text = movie.locations
        cell.detailTextLabel?.text = "Movie: \"\(movie.title)\" (\(movie.releaseYear.value))"
        return cell
    }
}
