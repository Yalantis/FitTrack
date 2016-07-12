//
//  CellInterface.swift
//  YALFitnessConcept
//
//  Created by Roman on 23.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

protocol CellInterface {
    
    static var id: String { get }
    static var cellNib: UINib { get }
    
}

extension CellInterface {
    
    static var id: String {
        return String(Self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
    
}

