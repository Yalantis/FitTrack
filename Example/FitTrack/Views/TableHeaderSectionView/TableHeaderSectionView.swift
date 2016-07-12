//
//  TableHeaderSectionView.swift
//  YALFitnessConcept
//
//  Created by Roman on 22.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

private let startIndicatorPosition: CGFloat = 0.0

class TableHeaderSectionView: UITableViewHeaderFooterView, CellInterface {

    @IBOutlet
    private weak var timelineButton: UIButton!
    
    @IBOutlet
    private weak var statisticsButton: UIButton!
    
    @IBOutlet
    private weak var segmentView: SegmentView!
    
    // MARK - Lifecycle
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        configureButtons()
    }
    
    // MARK - Provate methods
    private func configureButtons() {
        timelineButton.setTitleColor(UIColor.activeSegmentButtonFontBackgroundColor(), forState: .Selected)
        timelineButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        statisticsButton.setTitleColor(UIColor.activeSegmentButtonFontBackgroundColor(), forState: .Selected)
        statisticsButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        timelineButton.selected = true
        statisticsButton.selected = false
    }

    // MARK - Actions
    @IBAction func timelineButtonTapped(sender: AnyObject) {
        timelineButton.selected = true
        statisticsButton.selected = false
        segmentView.setIndicatorPosition(startIndicatorPosition)
    }

    @IBAction func statisticsButtonTapped(sender: AnyObject) {
        statisticsButton.selected = true
        timelineButton.selected = false
        segmentView.setIndicatorPosition(statisticsButton.bounds.width)
    }

}
