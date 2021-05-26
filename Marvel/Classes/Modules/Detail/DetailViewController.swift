//
//  DetailViewController.swift
//  Marvel
//
//  Created by Alfonso Miranda Castro on 28/02/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import UIKit
import Kingfisher

protocol DetailViewProtocol: BaseViewProtocol {
    func setTitile(title: String)
    func setInfo(title: String, description: String, image: String, comics: Int, series: Int)
}

class DetailViewController: BaseViewController {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var comicsLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.descriptionLabel.sizeToFit()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setTitile(title: String) {
        self.title = title
    }
    
    func setInfo(title: String, description: String, image: String, comics: Int, series: Int) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.thumbnailImageView.kf.setImage(with: URL(string: image))
        self.comicsLabel.text = "\(LocalizedKeys.Detail.comicsNumberLabel)\(comics)"
        self.seriesLabel.text = "\(LocalizedKeys.Detail.seriesNumberLabel)\(series)"
    }
}
