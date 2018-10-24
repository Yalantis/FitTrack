# FitTrack
[![Platform](http://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](http://cocoapods.org/?q=YALSideMenu) [![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)]()

Concept of a fitness app.

[![Yalantis](https://raw.githubusercontent.com/Yalantis/PullToRefresh/develop/PullToRefreshDemo/Resources/badge_dark.png)](https://yalantis.com/?utm_source=github)

<img src="https://d13yacurqjgara.cloudfront.net/users/226733/screenshots/2337201/open-uri20151106-3-2y7q4w" />

Check this <a href="https://dribbble.com/shots/2337201-Fitness-App-Prototype">project on dribbble</a>.

## Requirements
- iOS 9.0+
- Xcode 7
- Swift 2

## Installing with [CocoaPods](https://cocoapods.org)

```ruby
use_frameworks!
pod ‘FitTrack’, '~> 0.1.0’
```

## Usage

At first, import FitTrack:
```swift
import FitTrack
```

Then create animation view, for example, as outlet:
```swift
@IBOutlet private weak var animationView: AnimationView!
```

Then create collection of activities and configure animation view (pass these activities to animation view):
```swift
let activities = ActivityDataProvider.generateActivities()
animationView.configureSubviews(activities.count, activities: activities)
```

Сreation of activity is as follows:
```swift
// bike activity
let bikeLabelConfigurator = LabelConfigurator(textColor: UIColor.bikeActivityColor(), titleFontName: "SFUIText-Light", titleFontSize: 24, currentProgressFontName: "SFUIText-Bold", currentProgressFontSize: 48, goalFontName: "SFUIText-Light", goalLabelFontSize: 14)
let bikeActivityResource = ActivityResource(normalActivityButtonImage: UIImage(named: "bike_normal")!, selectedActivityButtonImage: UIImage(named: "bike_active")!, gradientImage: UIImage(named: "grad_green")!, labelConfigurator: bikeLabelConfigurator)
let bikeActivity = Activity(title: "Miles", goal: 2.5, currentProgress: 2, activityResource: bikeActivityResource)
activities.append(bikeActivity)
```

After configure animation view need to start animation:
```swift
animationView.performAnimation()
```

For more information, please, see example.

Have fun! :)

#### Let us know!

We’d be really happy if you sent us links to your projects where you use our component. Just send an email to github@yalantis.com And do let us know if you have any questions or suggestion regarding the animation. 

P.S. We’re going to publish more awesomeness wrapped in code and a tutorial on how to make UI for iOS (Android) better than better. Stay tuned!

## License

The MIT License (MIT)

Copyright © 2017 Yalantis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

