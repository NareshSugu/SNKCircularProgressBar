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
        circularProgressView = SNKCircularProgressView (frame: circularProgressBarView.frame, radius: 100, shapeLayerThikness: 5, progressLayerThikness: 20)
        self.view.addSubview(circularProgressView)

        progressIncrement = 1.0/duration
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showProgress), userInfo: nil, repeats: true)
    }
    
    @objc func showProgress()
    {
        if(progressCounter > 1.0){timer.invalidate()}
        circularProgressView.progress = progressCounter
        progressCounter = progressCounter + progressIncrement
    }

}

