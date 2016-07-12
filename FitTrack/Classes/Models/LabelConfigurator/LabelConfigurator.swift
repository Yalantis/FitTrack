//
//  LabelConfigurator.swift
//  Pods
//
//  Created by Roman on 12.07.16.
//
//

import Foundation

public struct LabelConfigurator {
    
    let textColor: UIColor?
    
    let titleFontName: String?
    let titleFontSize: CGFloat?
    
    let currentProgressFontName: String?
    let currentProgressFontSize: CGFloat?
    
    let goalFontName: String?
    let goalLabelFontSize: CGFloat?
    
    public init(textColor: UIColor, titleFontName: String, titleFontSize: CGFloat, currentProgressFontName: String, currentProgressFontSize: CGFloat, goalFontName: String, goalLabelFontSize: CGFloat) {
        self.textColor = textColor
        
        self.titleFontName = titleFontName
        self.titleFontSize = titleFontSize
        
        self.currentProgressFontName = currentProgressFontName
        self.currentProgressFontSize = currentProgressFontSize
        
        self.goalFontName = goalFontName
        self.goalLabelFontSize = goalLabelFontSize
    }
    
}