//
//  ZoomStartupAnimation.swift
//  YALFitnessConcept
//
//  Created by Roman Scherbakov on 22.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

private let startAnimationImageWidth: CGFloat = 172.0
private let finishAnimationImageWidth: CGFloat = 2000.0

private let transformAnimationDuration: NSTimeInterval = 0.3
private let transformAnimationDelay: NSTimeInterval = 1
private let maskBackgroundImageViewAnimationDuration: NSTimeInterval = 0.1
private let maskBackgroundImageViewAnimationDelay: NSTimeInterval = 1.1

class ZoomStartupAnimation {
    
    static func performAnimation(window: UIWindow, navControllerIdentifier: String, backgroundImage: UIImage, animationImage: UIImage) {
        let backgroundImageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImageView.image = backgroundImage

        window.addSubview(backgroundImageView)
        window.makeKeyAndVisible()
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navController = mainStoryboard.instantiateViewControllerWithIdentifier(navControllerIdentifier) as! UINavigationController
        window.rootViewController = navController
        
        navController.view.layer.mask = CALayer()
        navController.view.layer.mask!.contents = animationImage.CGImage
        navController.view.layer.mask!.bounds = CGRect(x: 0, y: 0, width: startAnimationImageWidth, height: startAnimationImageWidth)
        navController.view.layer.mask!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        navController.view.layer.mask!.position = CGPoint(x: navController.view.frame.width / 2, y: navController.view.frame.height / 2)
        
        let maskBackgroundImageView = UIImageView(frame: navController.view.layer.mask!.frame)
        maskBackgroundImageView.image = animationImage
        navController.view.addSubview(maskBackgroundImageView)
        navController.view.bringSubviewToFront(maskBackgroundImageView)
        
        createTransformAnimation(navController, maskBackgroundImageView: maskBackgroundImageView)
        maskBackgroundImageViewAnimation(maskBackgroundImageView, navController: navController)
    }
    
    private static func createTransformAnimation(navController: UINavigationController, maskBackgroundImageView: UIImageView) {
        let transformAnimation = CAKeyframeAnimation(keyPath: "bounds")
        transformAnimation.duration = transformAnimationDuration
        transformAnimation.beginTime = CACurrentMediaTime() + transformAnimationDelay
        let initalBounds = NSValue(CGRect: navController.view.layer.mask!.bounds)
        let finalBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: finishAnimationImageWidth, height: finishAnimationImageWidth))
        transformAnimation.values = [initalBounds, finalBounds]
        transformAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
        transformAnimation.removedOnCompletion = false
        transformAnimation.fillMode = kCAFillModeForwards
        navController.view.layer.mask!.addAnimation(transformAnimation, forKey: "maskAnimation")
        maskBackgroundImageView.layer.addAnimation(transformAnimation, forKey: "maskAnimation")
    }
    
    private static func maskBackgroundImageViewAnimation(maskBackgroundImageView: UIImageView, navController: UINavigationController) {
        UIView.animateWithDuration(maskBackgroundImageViewAnimationDuration,
            delay: maskBackgroundImageViewAnimationDelay,
            options: .CurveEaseIn,
            animations: {
                maskBackgroundImageView.alpha = 0.0
            },
            completion: { finished in
                if finished == true {
                    maskBackgroundImageView.removeFromSuperview()
                    navController.view.layer.mask = nil
                }
        })
    }
    
}