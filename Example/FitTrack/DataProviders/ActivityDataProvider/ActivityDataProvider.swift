//
//  ActivityDataProvider.swift
//  YALFitnessConcept
//
//  Created by Roman Scherbakov on 20.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit
import FitTrack

class ActivityDataProvider {
    
    static func generateActivities() -> [Activity] {
        var activities = [Activity]()
        
        // run activity
        let runLabelConfigurator = LabelConfigurator(textColor: UIColor.runActivityColor(), titleFontName: "SFUIText-Light", titleFontSize: 24, currentProgressFontName: "SFUIText-Bold", currentProgressFontSize: 48, goalFontName: "SFUIText-Light", goalLabelFontSize: 14)
        let runActivityResource = ActivityResource(normalActivityButtonImage: UIImage(named: "run_normal")!, selectedActivityButtonImage: UIImage(named: "run_active")!, gradientImage: UIImage(named: "grad_pink")!, labelConfigurator: runLabelConfigurator)
        let runActivity = Activity(title: "Steps", goal: 1240, currentProgress: 200, activityResource: runActivityResource)
        activities.append(runActivity)
        
        // calories activity
        let caloriesLabelConfigurator = LabelConfigurator(textColor: UIColor.caloriesActivityColor(), titleFontName: "SFUIText-Light", titleFontSize: 24, currentProgressFontName: "SFUIText-Bold", currentProgressFontSize: 48, goalFontName: "SFUIText-Light", goalLabelFontSize: 14)
        let caloriesActivityResource = ActivityResource(normalActivityButtonImage: UIImage(named: "cal_normal")!, selectedActivityButtonImage: UIImage(named: "cal_active")!, gradientImage: UIImage(named: "grad_orange")!, labelConfigurator: caloriesLabelConfigurator)
        let caloriesActivity = Activity(title: "Calories", goal: 2000, currentProgress: 1000, activityResource: caloriesActivityResource)
        activities.append(caloriesActivity)

        // distance activity
        let distanceLabelConfigurator = LabelConfigurator(textColor: UIColor.distanceActivityColor(), titleFontName: "SFUIText-Light", titleFontSize: 24, currentProgressFontName: "SFUIText-Bold", currentProgressFontSize: 48, goalFontName: "SFUIText-Light", goalLabelFontSize: 14)
        let distanceActivityResource = ActivityResource(normalActivityButtonImage: UIImage(named: "dis_normal")!, selectedActivityButtonImage: UIImage(named: "dis_active")!, gradientImage: UIImage(named: "grad_blue")!, labelConfigurator: distanceLabelConfigurator)
        let distanceActivity = Activity(title: "Miles", goal: 1.35, currentProgress: 0.9, activityResource: distanceActivityResource)
        activities.append(distanceActivity)

        // bike activity
        let bikeLabelConfigurator = LabelConfigurator(textColor: UIColor.bikeActivityColor(), titleFontName: "SFUIText-Light", titleFontSize: 24, currentProgressFontName: "SFUIText-Bold", currentProgressFontSize: 48, goalFontName: "SFUIText-Light", goalLabelFontSize: 14)
        let bikeActivityResource = ActivityResource(normalActivityButtonImage: UIImage(named: "bike_normal")!, selectedActivityButtonImage: UIImage(named: "bike_active")!, gradientImage: UIImage(named: "grad_green")!, labelConfigurator: bikeLabelConfigurator)
        let bikeActivity = Activity(title: "Miles", goal: 2.5, currentProgress: 2, activityResource: bikeActivityResource)
        activities.append(bikeActivity)
        
        // sleep activity
        let sleepLabelConfigurator = LabelConfigurator(textColor: UIColor.sleepActivityColor(), titleFontName: "SFUIText-Light", titleFontSize: 24, currentProgressFontName: "SFUIText-Bold", currentProgressFontSize: 48, goalFontName: "SFUIText-Light", goalLabelFontSize: 14)
        let sleepActivityResource = ActivityResource(normalActivityButtonImage: UIImage(named: "sleep_normal")!, selectedActivityButtonImage: UIImage(named: "sleep_active")!, gradientImage: UIImage(named: "grad_purple")!, labelConfigurator: sleepLabelConfigurator)
        let sleepActivity = Activity(title: "Hours", goal: 8, currentProgress: 5.5, activityResource: sleepActivityResource)
        activities.append(sleepActivity)
        
        return activities
    }
    
}
