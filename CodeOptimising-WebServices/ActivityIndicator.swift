//
//  ActivityIndicator.swift
//  CodeOptimising-WebServices
//
//  Created by anjani on 07/05/2018.
//  Copyright © 2018 anjani. All rights reserved.
//

import UIKit

extension UIView{
    
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
        activityIndicator.center = self.center
        activityIndicator.backgroundColor = (UIColor (white: 0.3, alpha: 0.8))   //create a background behind the spinner we can remove if we dont need this
        activityIndicator.layer.cornerRadius = 10
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.color = activityColor
        
        
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
}

}
