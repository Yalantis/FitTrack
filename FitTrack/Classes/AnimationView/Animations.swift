//
//  Animations.swift
//  YALFitnessConcept
//
//  Created by Roman Scherbakov on 17.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

private let animateDropDuration: NSTimeInterval = 0.3
private let animateDropDumping: CGFloat = 0.7
private let animateDropVelocity: CGFloat = 0.5

private let animateExtendDistanceDuration: NSTimeInterval = 0.2
private let animateExtendDistanceDelay: NSTimeInterval = 0.0

private let animateCollectActivitiesDuration: NSTimeInterval = 0.25
private let animateCollectActivitiesDelay: NSTimeInterval = 0.0

private let animateScaleFirstButtonDuration: NSTimeInterval = 0.2
private let animateScalFirsteButtonDelay: NSTimeInterval = 0.0
internal let animateScalFirsteButtonCoefficient: CGFloat = 1.33

private let animateMoveDuration: NSTimeInterval = 0.4
private let animateMoveDelay: NSTimeInterval = 0.0

private let animateScaleDuration: NSTimeInterval = 1.0
private let animateScaleDelay: NSTimeInterval = 0.0
private let animatScaleDumping: CGFloat = 0.3
private let animateScaleVelocity: CGFloat = 0.7

private let animateMoveFinalPositionDuration: NSTimeInterval = 0.3
private let animateMoveFinalPositionDelay: NSTimeInterval = 0.1

extension AnimationView {
    
    internal func aimateDrop() {
        struct Counter {
            static var index = 0
        }
        if Counter.index == roundActivityButtons.count {
            animateExtendDistance()
            
            return
        }
        let roundActivityButton = roundActivityButtons[Counter.index]
        let delay: NSTimeInterval = Counter.index == 0 ? 1 : 0
        UIView.animateWithDuration(animateDropDuration,
            delay: delay,
            usingSpringWithDamping: animateDropDumping,
            initialSpringVelocity: animateDropVelocity,
            options: .CurveLinear,
            animations: {
                let changedFrame = CGRectMake(roundActivityButton.frame.origin.x, (self.bounds.height / 2) / dropButtonsPositionCoefficient - roundActivityButton.frame.height / 2, roundActivityButton.frame.width, roundActivityButton.frame.height)
                roundActivityButton.frame = changedFrame
            }) { finished in
                if finished == true {
                    Counter.index += 1
                    self.aimateDrop()
                }
        }
    }
    
    private func animateExtendDistance() {
        UIView.animateWithDuration(animateExtendDistanceDuration,
            delay: animateExtendDistanceDelay,
            options: .CurveLinear,
            animations: {
                for index in 0..<self.activitiesCount {
                    if index == self.centerActivityRoundButtonIndex { // the number is odd then the central position of the index does not change
                        continue
                    }
                    let roundActivityButton = self.roundActivityButtons[index]
                    let originDeltaX: CGFloat = (self.activitiesCount / (index + 1)) < 2 ? -self.gapBetweenActivityButtons / 2 : self.gapBetweenActivityButtons / 2
                    let changedFrame = CGRectMake(roundActivityButton.frame.origin.x - originDeltaX, roundActivityButton.frame.origin.y, roundActivityButton.frame.width, roundActivityButton.frame.height)
                    roundActivityButton.frame = changedFrame
                }
            }) { finished in
                if finished == true {
                    self.animateCollect()
                }
        }
    }
    
    private func animateCollect() {
        UIView.animateWithDuration(animateCollectActivitiesDuration,
            delay: animateCollectActivitiesDelay,
            options: .CurveEaseIn,
            animations: {
                for index in 0..<self.activitiesCount {
                    if index == self.centerActivityRoundButtonIndex { // the number is odd then the central position of the index does not change
                        continue
                    }
                    let roundActivityButton = self.roundActivityButtons[index]
                    roundActivityButton.center = self.centerActivityRoundButton!.center
                }
            }) { finished in
                if finished == true {
                    self.animationScaleFirstButton()
                }
        }
    }
    
    private func animationScaleFirstButton() {
        UIView.animateWithDuration(animateScaleFirstButtonDuration,
            delay: animateScalFirsteButtonDelay,
            options: .CurveLinear,
            animations: {
                // scale first item
                let roundActivityButton = self.roundActivityButtons[0]
                roundActivityButton.transform = CGAffineTransformMakeScale(animateScalFirsteButtonCoefficient, animateScalFirsteButtonCoefficient)
            }) { finished in
                if finished == true {
                    self.animateMoveToTop()
                }
        }
    }
    
    private func animateMoveToTop() {
        UIView.animateWithDuration(animateMoveDuration,
            delay: animateMoveDelay,
            options: .CurveEaseIn,
            animations: {
                for index in 0..<self.activitiesCount {
                    let roundActivityButton = self.roundActivityButtons[index]
                    roundActivityButton.center = self.activityContainerView.center
                }
            }) { finished in
                if finished == true {
                    for index in 0..<self.activitiesCount {
                        let roundActivityButton = self.roundActivityButtons[index]
                        roundActivityButton.hidden = true
                    }
                    // make first button frame as other buttons
                    self.roundActivityButtons[0].frame = self.roundActivityButtons[1].frame
                    self.animateScaleVeiw()
                    self.animateMoveToFinalPosition()
                }
        }
    }
    
    private func animateScaleVeiw() {
        let currentActiveRoundButton = roundActivityButtons[0]
        currentActiveRoundButton.selected = true
        UIView.animateWithDuration(animateScaleDuration,
            delay: animateScaleDelay,
            usingSpringWithDamping: animatScaleDumping,
            initialSpringVelocity: animateScaleVelocity,
            options: .CurveEaseOut,
            animations: {
                self.activityContainerView.alpha = 1
                self.activityContainerView.transform = CGAffineTransformMakeScale(1, 1)
            }) { finished in
                if finished == true {
                    self.animationFirstPhaseDidFinish?()
                }
        }
    }
    
    private func animateMoveToFinalPosition() {
        UIView.animateWithDuration(animateMoveFinalPositionDuration,
            delay: animateMoveFinalPositionDelay,
            options: .CurveEaseInOut,
            animations: {
                for index in 0..<self.activitiesCount {
                    let roundActivityButton = self.roundActivityButtons[index]
                    roundActivityButton.hidden = false
                    roundActivityButton.userInteractionEnabled = true
                    let finalFrame = CGRectMake(self.gapBetweenActivityButtons + (self.gapBetweenActivityButtons + self.realActivityButtonWidth) * CGFloat(index), self.bounds.height / 2 * finalButtonsPositionCoefficient - roundActivityButton.frame.height / 2, self.realActivityButtonWidth, self.realActivityButtonWidth)
                    roundActivityButton.frame = finalFrame
                }
            }, completion:nil)
    }
    
}