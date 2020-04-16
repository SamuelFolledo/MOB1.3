//
//  PokemonVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

struct Root: Codable {
    var results: [PokemonCodable]
}

struct PokemonCodable: Codable {
//    var pokemon: Pokemon
//    var forms: [Form]
    var name: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

struct Form: Codable { //forms in the API
    var name: String
    var url: String
}

class Pokemon { //forms in the API
    let name: String!
    let url: String!
    var id: Int = 0
    var imageUrl: String = ""
    var image: UIImage = UIImage()
    var shinyImageUrl: String = ""
    var shinyImage: UIImage = UIImage()
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

class PokemonVC: UIViewController {
    
    var pokemons: [Pokemon] = []
    let pokeapiURL: String = "https://pokeapi.co/api/v2"
    
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
    
//    func fetchPokemon() {
//        let defaultSession = URLSession(configuration: .default)
//        //        https://pokeapi.co/api/v2/evolution-chain/?limit=20&offset=20
//        if let url = URL(string: "\(pokeapiURL)/pokemon/1") {
//            let request = URLRequest(url: url)
//            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
//                guard error == nil else {
//                    print ("error: ", error!)
//                    return
//                }
//
//                do {
//                    if let data = data {
//                        //                        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
//                        let jsonResult = try JSONDecoder().decode(PokemonCodable.self, from: data)
//                        print("JSON RESULT = ", jsonResult, "\n")
//                        DispatchQueue.main.async {
//                            //                            let name = jsonResult["name"] as? String ?? ""
//                            print("NAME IS \(jsonResult.name)")
//                            //                            print("URL = \(jsonResult.forms)")
////                            for form in jsonResult.forms {
////                                print(form)
////                            }
//                            //                            self.fetchNasaDailyImage(hdurl: hdurl)
//                        }
//                    }
//                } catch {
//                    print("Error deserializing JSON: \(error)")
//                }
//            })
//            dataTask.resume()
//        }
//    }
    
    func fetchPokemons() {
        let defaultSession = URLSession(configuration: .default)
        if let url = URL(string: "\(pokeapiURL)/pokemon/?limit=20&offset=\(pokemons.count)") {
            let request = URLRequest(url: url)
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                guard error == nil else {
                    print ("error: ", error!)
                    return
                }
                guard let data = data else {
                    print("No data")
                    return
                }
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                    print("JSON RESULT = ", jsonResult, "\n")
                    let pokemonsFromJson = try JSONDecoder().decode(Root.self, from: data)
                    DispatchQueue.main.async {
                        for pokemon in pokemonsFromJson.results {
                            self.pokemons.append(Pokemon(name: pokemon.name, url: pokemon.url))
                        }
                        self.tableView.reloadData()
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
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        let pokemon = pokemons[indexPath.row]
        cell.nameLabel.text = pokemon.name
        return cell
    }
}

//{"pokemonUrl": [
//    {
//    "name": "bulbasaur";
//    "url": "https://pokeapi.co/api/v2/pokemon/1/";
//    },
//    {
//    "name": "ivysaur";
//    "url": "https://pokeapi.co/api/v2/pokemon/2/";
//    },
//    {
//    "name": "venusaur";
//    "url": "https://pokeapi.co/api/v2/pokemon/3/";
//    }
//]}
