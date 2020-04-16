//
//  PokemonVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

struct PokemonURL {
//    var pokemon: Pokemon
    var url: String
    var name: String
}

struct Pokemon {
    var name: String
    var imageUrl: String
    var image: UIImage
}

class PokemonVC: UIViewController {
    
    var pokemons: [PokemonURL] = []
    let pokeAPI: String = "https://pokeapi.co/api/v2/"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        fetchPokemons()
    }
    
    fileprivate func setupTable() {
        self.title = "Pokemon API"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchPokemons() {
        let defaultSession = URLSession(configuration: .default)
        if let url = URL(string: "\(pokeAPI)/pokemon/1") {
            let request = URLRequest(url: url)
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                guard error == nil else {
                    print ("error: ", error!)
                    return
                }
                
                do {
                    if let data = data,
                        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
                        print("JSON RESULT = ", jsonResult, "\n")
                        DispatchQueue.main.async {
                            let name = jsonResult["name"] as? String ?? ""
                            print("NAME IS \(name)")
//                            self.fetchNasaDailyImage(hdurl: hdurl)
                        }
                    }
                } catch {
                    print("Error deserializing JSON: \(error)")
                }
            })
            dataTask.resume()
        }
    }

}

extension PokemonVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension PokemonVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
//        let pokemon = pokemons[indexPath.row]
        cell.nameLabel.text = "pokemon1"
        return cell
    }
}
