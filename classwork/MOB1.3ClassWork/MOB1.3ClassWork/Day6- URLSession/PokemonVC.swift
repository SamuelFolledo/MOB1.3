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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    fileprivate func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
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
