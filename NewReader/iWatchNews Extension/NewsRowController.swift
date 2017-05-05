//
//  NewsRowController.swift
//  NewReader
//
//  Created by Abhishek on 05/05/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit
import WatchKit

class NewsRowController: NSObject {

    @IBOutlet var imgView: WKInterfaceImage?
    @IBOutlet var textLabel: WKInterfaceLabel?
    @IBOutlet var descLabel: WKInterfaceLabel!
    
    
    var newsObject: NRSource? {
    
        didSet{
            if let source = newsObject {
                self.imgView?.setImage(UIImage(named: "download.jpeg"))
                self.textLabel?.setText(source.name! as String)
                self.descLabel?.setText(source.sourceDescription! as String)
            }
        }
    }
}


/*
 REMEMBER ROW LAYOUT HORIZONTAL OR VERTICAL FOR ALIGNMENT OF SUBVIEWS IN GROUP
 SUPER GROUP -> SUB GROUP & LABEL
 SUPER GROUP = VERTICAL LAYOUT
 SUB GROUP = HORIZONTAL LAYOUT
 
 */
