//
//  PokemonVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class PokemonVC: UIViewController {
    
    var pokemons: [Pokemon] = [] {
        didSet {
            self.pokemons.sort(){ $0.id < $1.id }
            tableView.reloadData()
        }
    }
    let pokeapiURL: String = "https://pokeapi.co/api/v2"
    let limit: Int = 20 //limit on how many pokemons to fetch at a time
    var fromIndex: Int = 0
    var nextUrl: String = ""
    
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
        if nextUrl == "" { //check if next url is empty
            nextUrl = "\(pokeapiURL)/pokemon/?limit=\(limit)&offset=\(fromIndex)"
        }
        fetchFromUrl(nextUrl) { (data, error) in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                //                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                //                    print("JSON RESULT = ", jsonResult, "\n")
                let pokemonsFromJson = try JSONDecoder().decode(Root.self, from: data)
                self.nextUrl = pokemonsFromJson.next
                //                    DispatchQueue.main.async {
                for pokemonResult in pokemonsFromJson.results {
                    let pokemon = Pokemon(name: pokemonResult.name, url: pokemonResult.url)
                    pokemon.fetchPokemonDetails { (error) in
                        if let error = error {
                            print("Error:", error)
                            return
                        }
                        
                        DispatchQueue.main.async {
                            self.pokemons.append(pokemon)
                            self.fromIndex = self.pokemons.count
                            //                                    print("\(pokemon.name): \(pokemon.imageUrl) and \(pokemon.shinyImageUrl)")
                            self.tableView.reloadData()
                        }
                    }
                }
            } catch {
                print("Error deserializing JSON: \(error)")
            }
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
        cell.idLabel.text = "\(String(indexPath.row)) \(String(pokemon.id))"
        if indexPath.row == pokemons.count - 1 { //if last cell, fetch more pokemons
            fetchPokemons()
        }
        return cell
    }
}
