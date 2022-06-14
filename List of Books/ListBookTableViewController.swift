//
//  ListBookTableViewController.swift
//  List of Books
//
//  Created by Admin on 14.06.2022.
//

import UIKit

class ListBookTableViewController: UITableViewController {
    
    var objects = [
        Book(emojiBook: "🐶🫀💉", name: "A dog's hert", author: "Mikhail Bulgakov", isfavourite: false),
        Book(emojiBook: "🌳⛓🐱", name: "Ruslan and Lyudmila", author: "Alexander Pushkin", isfavourite: false),
        Book(emojiBook: "🤡🎈😱", name: "IT", author: "Stephen King", isfavourite: false),
        Book(emojiBook: "👱🏻‍♀️🚂☠️", name: "Anna Karenina", author: "Lev Tolstoy", isfavourite: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "List of Books"
        self.navigationItem.leftBarButtonItem = self.editButtonItem

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListBookCell", for: indexPath) as! ListBookTableViewCell
        
        let object = objects[indexPath.row]
        
        cell.set(object: object)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }

}
