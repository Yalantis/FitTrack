//
//  MyDayFitViewController.swift
//  YALFitnessConcept
//
//  Created by Roman on 15.03.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit
import FitTrack

private let ratioCoefficient: CGFloat = 3.117
private let tableHeaderSectionViewHeight: CGFloat = 114.0
private let tableCellHeight: CGFloat = 105.0
private let rowsCount = 10
private let tableHeaderSectionViewHeightDelta: CGFloat = 64.0
private let animationDuration: NSTimeInterval = 0.3
private let maxHeaderSectionAlphaValue: CGFloat = 0.95
private let cornerRadius: CGFloat = 12.0

private enum HeaderSectionState {
    case VisibleState
    case UnvisibleState
}

class MyDayFitViewController: UIViewController {
    
    @IBOutlet
    private weak var animationView: AnimationView!
    
    @IBOutlet
    private weak var activityTableView: UITableView!
    
    @IBOutlet
    private weak var helperView: UIView!
        
    @IBOutlet
    private weak var activityTableViewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet
    private weak var activityTableViewTrailingConstraint: NSLayoutConstraint!
    
    private var tableHeaderSectionView: TableHeaderSectionView!
    private var headerSectionState = HeaderSectionState.UnvisibleState
    private var backgroundHeaderSectionView: UIView!
    
    // MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundHeaderSectionView = UIView(frame: helperView.frame)
        animationView.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.width - activityTableViewLeadingConstraint.constant + activityTableViewTrailingConstraint.constant, view.frame.height)
        setTitleView()
        setupTableView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        configureAnimationView()
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.3 * Double(NSEC_PER_SEC))) // perform animation after 0.3 s
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.animationView.performAnimation()
        }
    }
    
    // MARK - Private methods
    private func setTitleView() {
        let logo = UIImage(named: "myDayFit")
        let imageView = UIImageView(image:logo)
        navigationItem.titleView = imageView
    }
    
    private func setupTableView() {
        activityTableView.registerNib(ActivityTableViewCell.cellNib, forCellReuseIdentifier: ActivityTableViewCell.id)
        activityTableView.registerNib(TableHeaderSectionView.cellNib, forHeaderFooterViewReuseIdentifier: TableHeaderSectionView.id)
    }
    
    private func configureAnimationView() {
        let activities = ActivityDataProvider.generateActivities()
        animationView.configureSubviews(activities.count, activities: activities)
        animationView.animationFirstPhaseDidFinish = {
            [UIView.beginAnimations(nil, context: nil)]
            [UIView.setAnimationDuration(animationDuration)]
            self.animationView.frame = CGRect(x: 0.0, y: 0.0, width: self.animationView.frame.width, height: self.animationView.frame.height - (self.animationView.frame.height / ratioCoefficient) - tableHeaderSectionViewHeightDelta)
            self.activityTableView.tableHeaderView = self.animationView
            self.navigationController!.navigationBarHidden = false
            [UIView.commitAnimations]
        }
    }
    
    // MARK - UITableViewDatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ActivityTableViewCell.id, forIndexPath: indexPath)
        return cell
    }
    
    // MARK - UITableViewDelegate
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let activityTableViewCell = cell as! ActivityTableViewCell
        if indexPath.row == 0 {
            activityTableViewCell.setBackgroundImage(UIImage(named: "bg_white_top")!)
        } else if indexPath.row == rowsCount - 1 {
            activityTableViewCell.setBackgroundImage(UIImage(named: "bg_white_bottom")!)
            cell.clipsToBounds = true
        } else {
            activityTableViewCell.setBackgroundImage(UIImage(named: "bg_white_middle")!)
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerSction = tableView.dequeueReusableHeaderFooterViewWithIdentifier(TableHeaderSectionView.id) as! TableHeaderSectionView
        tableHeaderSectionView = headerSction
        backgroundHeaderSectionView.backgroundColor = UIColor.clearColor()
        tableHeaderSectionView.backgroundView = backgroundHeaderSectionView
        return headerSction
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableHeaderSectionViewHeight
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableCellHeight
    }
    
    // MARK - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        if scrollView.contentOffset.y > 0 {
            animationView.alpha = 1 - scrollView.contentOffset.y / animationView.frame.height
            helperView.alpha = min(1 - animationView.alpha, maxHeaderSectionAlphaValue)
            if animationView.alpha <= 0 && headerSectionState == HeaderSectionState.UnvisibleState {
                backgroundHeaderSectionView.backgroundColor = helperView.backgroundColor?.colorWithAlphaComponent(maxHeaderSectionAlphaValue)
                tableHeaderSectionView.backgroundView = backgroundHeaderSectionView
                headerSectionState = HeaderSectionState.VisibleState
            } else if animationView.alpha > 0 && headerSectionState == HeaderSectionState.VisibleState {
                backgroundHeaderSectionView.backgroundColor = UIColor.clearColor()
                tableHeaderSectionView.backgroundView = backgroundHeaderSectionView
                headerSectionState = HeaderSectionState.UnvisibleState
            }
        } else {
            helperView.alpha = 0
            animationView.alpha = 1
        }
        
    }
}
