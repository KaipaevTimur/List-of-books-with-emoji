//
//  BookNewAddTableViewController.swift
//  List of Books
//
//  Created by Admin on 18.06.2022.
//

import UIKit

class BookNewAddTableViewController: UITableViewController {
    
    var book = Book(emojiBook: "", name: "", author: "", isfavourite: false)
    
    @IBOutlet weak var emojiTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var authorTF: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateSaveButtonState()
        
    }
    
    func updateSaveButtonState() {
        let emojiText = emojiTF.text ?? ""
        let nameText = nameTF.text ?? ""
        let authorText = authorTF.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !authorText.isEmpty
    }
    
    private func updateUI() {
        emojiTF.text = book.emojiBook
        nameTF.text = book.name
        authorTF.text = book.author
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let emoji = emojiTF.text ?? ""
        let name = nameTF.text ?? ""
        let author = authorTF.text ?? ""
        
        self.book = Book(emojiBook: emoji, name: name, author: author, isfavourite: self.book.isfavourite)
    }
    
}
