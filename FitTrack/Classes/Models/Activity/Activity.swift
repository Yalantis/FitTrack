//
//  Activity.swift
//  YALFitnessConcept
//
//  Created by Roman Scherbakov on 20.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

public struct Activity {
    
    let title: String!
    let goal: Float!
    let currentProgress: Float!
    let activityResource: ActivityResource!
    
    public init (title: String, goal: Float, currentProgress: Float, activityResource: ActivityResource) {
        self.title = title
        self.goal = goal
        self.currentProgress = currentProgress
        self.activityResource = activityResource
    }
    
}
