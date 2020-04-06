//
//  GiphySearchVC.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/5/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class GiphySearchVC: UIViewController {
    
    var network = GifNetwork()
    var gifs: [Gif] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.placeholder = "What's your favorite gif?"
        searchBar.returnKeyType = .search
    }
    
    /**
    Fetches gifs based on the search term and populates tableview
    - Parameter searchTerm: The string to search gifs of
    */
    func fetchGifs(for searchText: String) {
        network.fetchGifs(searchTerm: searchText) { results in
            if results != nil {
                print(results!.gifs.count)
                self.gifs = results!.gifs
                self.tableView.reloadData()
            }
        }
    }

}

// MARK: - Tableview functions
extension GiphySearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GifCell.identifier) as! GifCell
        return cell
    }
}

extension GiphySearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

// MARK: - Search bar functions
extension GiphySearchVC: UISearchTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != nil {
            fetchGifs(for: textField.text!)
        }
        return true
    }
}
