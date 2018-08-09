//
//  SNKCircularProgressView.swift
//  SNKCircularProgressBar
//
//  Created by Norace Kumar on 8/9/18.
//  Copyright © 2018 SNK. All rights reserved.
//

import UIKit

class SNKCircularProgressView: UIView {

    var bgPath: UIBezierPath!
    var shapeLayer: CAShapeLayer!       // Background layer
    var progressLayer: CAShapeLayer!    // Forground layer

    var progress: Float = 0 {
        willSet(newValue)
        {
            //observes for change in value of progress variable and set the new value to it here.
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgPath = UIBezierPath()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        bgPath = UIBezierPath()
    }

    private func createCirclePath()
    {
        //Draw circle
    }

}
