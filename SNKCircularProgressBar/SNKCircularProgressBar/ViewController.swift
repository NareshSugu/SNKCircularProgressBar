//
//  ViewController.swift
//  SNKCircularProgressBar
//
//  Created by Norace Kumar on 8/9/18.
//  Copyright © 2018 SNK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circularProgressBarView: SNKCircularProgressView!
    var timer: Timer!
    var progressCounter:Float = 0
    let duration:Float = 10.0
    var progressIncrement:Float = 0
    var circularProgressView: SNKCircularProgressView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // customize radius and thikness and color here
        circularProgressView = SNKCircularProgressView (frame: circularProgressBarView.frame, radius: 80, shapeLayerThikness: 3, progressLayerThikness: 15)
        circularProgressView.progressForegroundStrokeColor = UIColor.blue
        circularProgressView.progressBackgroundStrokeColor = UIColor.gray
        
        self.view.addSubview(circularProgressView)
        
        progressIncrement = 1.0/duration
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showProgress), userInfo: nil, repeats: true)

    }
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        circularProgressView.frame = circularProgressBarView.frame
    }
    
    @objc func showProgress()
    {
        if(progressCounter > 1.0){timer.invalidate()}
        circularProgressView.progress = progressCounter
        progressCounter = progressCounter + progressIncrement
    }

}

