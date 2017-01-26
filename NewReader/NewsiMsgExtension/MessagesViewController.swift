//
//  MessagesViewController.swift
//  NewsiMsgExtension
//
//  Created by Abhishek Thapliyal on 1/27/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableArray : NSMutableArray?
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableArray = NSMutableArray()
        self.fetchSources()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

    //=======================================================================================================================================
    // TABLE VIEW DELEGATES
    //=======================================================================================================================================
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let source = self.tableArray?.object(at: indexPath.row) as! NRSource
        
        let message = MSMessage()
        let layout =  MSMessageTemplateLayout()
        layout.caption = String(format: "%@: %@", (source.name as String?)!, (source.sourceDescription as String?)!)

        let imageURL = NSURL(string : source.large as! String)
        do {
             layout.image = try UIImage(data : NSData(contentsOf: imageURL as! URL) as Data)
        } catch  {
            layout.image = nil
        }
        message.layout = layout
        
        self.activeConversation?.insert(message, completionHandler: { (error) in
            
        })
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.tableArray?.count)!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "NRExtTableCell") as! NRExtTableCell
        
        let source = self.tableArray?.object(at: indexPath.row) as! NRSource
        tableCell.titleLabel.text = source.name as String?
        tableCell.descriptionLabel.text = source.sourceDescription as String?
        
        return tableCell
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //====================================================================================================================================
    // GET SOURCES FROM SERVER
    //====================================================================================================================================
    
    func fetchSources() {
        
        self.loader.startAnimating()
        let networkManager = NRNetworkManager()
        networkManager.getNewsSource(completion: { (sourceArray, error) in
            
            OperationQueue.main.addOperation {
                self.tableArray = NSMutableArray(array: sourceArray)
                self.loader.stopAnimating()
                self.tableView.reloadData()
            }
        })
    }
}