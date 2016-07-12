//
//  ActivityTableViewCell.swift
//  YALFitnessConcept
//
//  Created by Roman on 23.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell, CellInterface {
    
    @IBOutlet
    private weak var backgroundImageView: UIImageView!
    
    func setBackgroundImage(image: UIImage) {
        backgroundImageView.image = image
    }
    
}
