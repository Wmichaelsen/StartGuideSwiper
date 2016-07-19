//
//  IntroViewController.swift
//  Looking4friends
//
//  Created by Wilhelm Michaelsen on 2016-07-19.
//  Copyright © 2016 Wilhelm Michaelsen. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    private let login: Login = Login()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let introPageViewController = segue.destinationViewController as? IntroPageViewController {
            introPageViewController.customDelegate = self
        }
    }
    
    @IBAction func connectToFacebook(sender: AnyObject) {
        
    }
}

extension IntroViewController: IntroPageViewControllerDelegate {
    
    func tutorialPageViewController(tutorialPageViewController: IntroPageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: IntroPageViewController,
                                    didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
