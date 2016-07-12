//
//  ActivityResource.swift
//  YALFitnessConcept
//
//  Created by Roman Scherbakov on 20.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

public struct ActivityResource {
    
    let normalActivityButtonImage: UIImage!
    let selectedActivityButtonImage: UIImage!
    let gradientImage: UIImage!
    let labelConfigurator: LabelConfigurator?
 
    public init(normalActivityButtonImage: UIImage, selectedActivityButtonImage: UIImage, gradientImage: UIImage, labelConfigurator: LabelConfigurator? = nil) {
        self.normalActivityButtonImage = normalActivityButtonImage
        self.selectedActivityButtonImage = selectedActivityButtonImage
        self.gradientImage = gradientImage
        self.labelConfigurator = labelConfigurator
    }
}