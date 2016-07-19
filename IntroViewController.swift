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
        
        /* Does the actual login with UI */
        
        login.setFirebaseURL("https://sizzling-heat-9137.firebaseio.com/")
        login.setFBPermission(["email", "public_profile", "user_birthday"])
        
        login.loginFromViewController(self, completion: {
            (firebaseError, facebookError, authData) in
            if firebaseError != nil {
                print("Firebase error: \(firebaseError!)")
            } else if facebookError != nil {
                print("Facebook error: \(facebookError!)")
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
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