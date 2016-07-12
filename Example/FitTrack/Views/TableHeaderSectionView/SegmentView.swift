//
//  SegmentView.swift
//  YALFitnessConcept
//
//  Created by Roman on 22.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

private let segmentViewCornerRadius: CGFloat = 13.0
private let segmentViewBoederWidth: CGFloat = 1.0

class SegmentView: UIView {

    private let buttonOvalLayer = CAShapeLayer()

    // MARK - Lifecycle
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        configureSegmentView()
        createButtonOvalLayer()
    }
    
    // MARK - Private methods
    private func configureSegmentView() {
        layer.cornerRadius = segmentViewCornerRadius
        layer.borderWidth = segmentViewBoederWidth
        layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    private func createButtonOvalLayer() {
        let buttonOvalLayerHeight = bounds.height
        let buttonOvalLayerWidth = bounds.width / 2
        let buttonOvalPath = UIBezierPath(roundedRect: CGRectMake(0, 0, buttonOvalLayerWidth, buttonOvalLayerHeight), cornerRadius: segmentViewCornerRadius)
        buttonOvalLayer.path = buttonOvalPath.CGPath
        buttonOvalLayer.fillColor = UIColor.whiteColor().CGColor
        layer.addSublayer(buttonOvalLayer)
    }
    
    // MARK - Public methods
    func setIndicatorPosition(position: CGFloat) {
        buttonOvalLayer.position = CGPointMake(position, bounds.origin.y)
    }
}
