//
//  ListBookTableViewCell.swift
//  List of Books
//
//  Created by Admin on 14.06.2022.
//

import UIKit

class ListBookTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emojiBookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func set(object: Book) {
        self.emojiBookLabel.text = object.emojiBook
        self.nameLabel.text = object.name
        self.authorLabel.text = object.author
    }
    

}
