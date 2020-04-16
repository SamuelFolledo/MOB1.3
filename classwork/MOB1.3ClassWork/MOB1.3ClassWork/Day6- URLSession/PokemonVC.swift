//
//  PokemonVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

struct Root: Codable {
    let next: String //next url, didnt need to use
    let count: Int //total Pokemons, didnt need to use
    let results: [PokemonCodable]
}

struct PokemonCodable: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

struct PokemonDetail: Codable {
    let name: String
    let forms: [Form]
}

struct Form: Codable { //forms in the API
    var id: Int
    var name: String
    var sprites: Sprite
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case sprites = "sprites"
    }
}

struct Sprite: Codable { //images
    var front: String
    var shinyFront: String
    
    enum CodingKeys: String, CodingKey {
        case front = "front_default"
        case shinyFront = "front_shiny"
    }
}

class Pokemon { //forms in the API
    let name: String!
    let url: String!
    let formUrl: String!
    var id: Int = 0
    var imageUrl: String = ""
    var image: UIImage = UIImage()
    var shinyImageUrl: String = ""
    var shinyImage: UIImage = UIImage()
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
        var formUrl = url
        self.formUrl = formUrl.insert(str: "-form", after: "pokemon") //insert -form after pokemon to get
    }
    
    ///fetch pokemon's images
    func fetchPokemonDetails(completion: @escaping (_ error: String?) -> Void) {
        fetchFromUrl(self.formUrl) { (data, error) in
            if let error = error {
                completion(error)
            }
            guard let data = data else { completion("No data"); return }
            do {
//                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
//                    print("JSON RESULT = ", jsonResult, "\n")
                let pokemonsFromJson = try JSONDecoder().decode(Form.self, from: data)
                self.id = pokemonsFromJson.id
                self.imageUrl = pokemonsFromJson.sprites.front
                self.shinyImageUrl = pokemonsFromJson.sprites.shinyFront
                if self.imageUrl != "" {
                    fetchImage(imageUrl: self.imageUrl) { (image, error) in
                        if let error = error {
                            completion(error)
                        }
                        self.image = image!
                    }
                }
                if self.shinyImageUrl != "" {
                    fetchImage(imageUrl: self.shinyImageUrl) { (image, error) in
                        if let error = error {
                            completion(error)
                        }
                        self.shinyImage = image!
                    }
                }
                completion(nil)
            } catch {
                print("Error deserializing JSON: \(error)")
            }
        }
    }
}

func fetchImage(imageUrl: String, completion: @escaping (_ image: UIImage?, _ error: String?) -> Void) {
    let defaultSession = URLSession(configuration: .default)
    
    if let url = URL(string: imageUrl) {
        let request = URLRequest(url: url)
        let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            guard let data = data else {
                completion(nil, "No data")
                return
            }
            //            completion(data, nil)
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    //TODO: Insert downloaded image into imageView
                    completion(image, nil)
                }
            } else {
                print("No Data fetched")
            }
        })
        dataTask.resume()
    }
}


///fetch from URL and returns data or error
func fetchFromUrl(_ urlString: String, completion: @escaping (_ data: Data?, _ error: String?) -> Void) {
    let defaultSession = URLSession(configuration: .default)
    if let url = URL(string: urlString) {
        let request = URLRequest(url: url)
        let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            guard let data = data else {
                completion(nil, "No data")
                return
            }
            completion(data, nil)
        })
        dataTask.resume()
    }
}

class PokemonVC: UIViewController {
    
    var pokemons: [Pokemon] = []
    let pokeapiURL: String = "https://pokeapi.co/api/v2"
    let limit: Int = 20 //limit on how many pokemons to fetch at a time
    var fromIndex: Int = 0
    
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
    
    func fetchPokemons() { //fetch 20 pokemons aat a time
        let defaultSession = URLSession(configuration: .default)
        if let url = URL(string: "\(pokeapiURL)/pokemon/?limit=\(limit)&offset=\(fromIndex)") {
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
//                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
//                    print("JSON RESULT = ", jsonResult, "\n")
                    let pokemonsFromJson = try JSONDecoder().decode(Root.self, from: data)
//                    DispatchQueue.main.async {
                        for pokemonResult in pokemonsFromJson.results {
                            let pokemon = Pokemon(name: pokemonResult.name, url: pokemonResult.url)
//                            pokemon.formUrl = pokemon.url.insert(str: "-form", after: "pokemon")
                            pokemon.fetchPokemonDetails { (error) in
                                if let error = error {
                                    print("Error:", error)
                                    return
                                }
                                DispatchQueue.main.async {
                                    self.pokemons.append(pokemon)
                                    self.fromIndex = self.pokemons.count
//                                    print("\(pokemon.name): \(pokemon.imageUrl) and \(pokemon.shinyImageUrl)")
                                    self.pokemons.sort(){ $0.id < $1.id }
                                    self.tableView.reloadData()
                                }
                            }
                        }
//                    }
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
        return 100
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
        cell.imgView.image = pokemon.image
        cell.shinyImageView.image = pokemon.shinyImage
        cell.idLabel.text = "\(pokemon.id)"
        if indexPath.row == pokemons.count - 1 { //if last cell, fetch more pokemons
            fetchPokemons()
        }
        return cell
    }
}
