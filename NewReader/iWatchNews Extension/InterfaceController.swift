//
//  InterfaceController.swift
//  iWatchNews Extension
//
//  Created by Abhishek on 05/05/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var wkTableView: WKInterfaceTable!
    
    var tableArray: [NRSource]?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        
        fetchSources {
            self.wkTableView.setNumberOfRows((self.tableArray?.count)!, withRowType: "SourceRow") // ROW IDENTIFIER 
            // Here we have to maulyy sert data : i.e no reload data is available
            for index in 0..<self.wkTableView.numberOfRows {
                if let controller = self.wkTableView.rowController(at: index) as? NewsRowController {
                    controller.newsObject = self.tableArray?[index]
                }
            }
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func fetchSources(completion: @escaping () -> Void) {
        
        let networkManager = NRNetworkManager()
        networkManager.getNewsSource(completion: { (sourceArray, error) in
            
            OperationQueue.main.addOperation {
                self.tableArray = sourceArray as? [NRSource]
                completion() // since noe reload data availbel for table hence completion call back
            }
        })
    }
}
