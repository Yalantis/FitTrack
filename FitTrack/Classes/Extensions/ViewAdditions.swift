//
//  ViewAdditions.swift
//  YALFitnessConcept
//
//  Created by Roman Scherbakov on 22.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundSpecificCorners(corners: UIRectCorner, cornerRadius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSizeMake(cornerRadius, cornerRadius))
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.CGPath
        layer.mask = maskLayer
    }
    
    func xibSetup(inout subview: UIView?, nibName: String) {
        subview = loadViewFromNib(nibName)
        subview!.frame = bounds
        subview!.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(subview!)
    }
    
    private func loadViewFromNib(nibName: String) -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }

    
}
