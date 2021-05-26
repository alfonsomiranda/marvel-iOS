//
//  CardTableViewCell.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: BaseTableViewCell<CharacterViewModel> {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.labelDescription.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.thumbnailImageView.image = nil
    }
    
    override func configure(cellModel: CharacterViewModel) {
        super.configure(cellModel: cellModel)
        
        self.labelTitle.text = self.cellModel?.name
        self.labelDescription.text = self.cellModel?.characterDescription
        if let thumbnailImage = self.cellModel?.thumbnailImage {
            self.thumbnailImageView.kf.setImage(with: URL(string: thumbnailImage))
        }
    }
}
