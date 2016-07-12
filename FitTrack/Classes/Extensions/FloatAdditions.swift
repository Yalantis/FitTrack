//
//  FloatAdditions.swift
//  YALFitnessConcept
//
//  Created by Roman Scherbakov on 20.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

extension Float {
    
    var cleanValue: String {
        return self % 1 == 0 ? String(format: "%.0f", self) : String(self)
    }
    
}