//
//  ViewController.swift
//  AppEventCount
//
//  Created by Ryo Togashi on 2019-08-26.
//  Copyright © 2019 Ryo Togashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willTerminateLabel: UILabel!
    
    var launchCount = 0
    var resignActiveCount = 0
    var didEnterBackgroundCount = 0
    var willEnterForegroundCount = 0
    var didBecomeActiveCount = 0
    var willTerminateCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        defaults.set(launchCount, forKey: "launchCount")
        updateUI()
    }
    
    func updateUI() {
        didFinishLaunchingLabel.text = "The app has launched \(launchCount) times"
        willResignActiveLabel.text = "applicationWillResignActive has been called \(resignActiveCount) times"
        didEnterBackgroundLabel.text = "applicationDidEnterBackground has been called \(didEnterBackgroundCount) times"
        willEnterForegroundLabel.text = "applicationWillEnterForeground has been called \(willEnterForegroundCount) times"
        didBecomeActiveLabel.text = "applicationDidBecomeActive has been called \(didBecomeActiveCount) times"
        willTerminateLabel.text = "applicationWillTerminate has been called \(willTerminateCount) times"
        
    }


}

