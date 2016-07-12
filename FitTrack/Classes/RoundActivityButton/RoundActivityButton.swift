//
//  RoundActivityButton.swift
//  YALFitnessConcept
//
//  Created by Roman on 15.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

internal class RoundActivityButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureRoundActivityButton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureRoundActivityButton()
    }
    
    private func configureRoundActivityButton() {
        layer.cornerRadius = frame.height / 2
    }
}
