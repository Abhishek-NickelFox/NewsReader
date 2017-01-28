//
//  NRArticle.swift
//  NewReader
//
//  Created by Abhishek Thapliyal on 1/23/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class NRArticle: NSObject {

    public var author : NSString?
    public var title : NSString?
    public var newsdescription : NSString?
    public var url : NSString?
    public var urlToImage : NSString?
    public var publishedAt : NSString?
    
    override init() {
        
    }
    
    init(dictionary : [String:Any]) {
        super.init()
        self.parseDictionary(dictionary: dictionary)
    }
    
    public func parseDictionary(dictionary : [String:Any]) {
    
        self.author = dictionary["author"] as? NSString
        self.title = dictionary["title"] as? NSString
        self.newsdescription = dictionary["description"] as? NSString
        self.url = dictionary["url"] as? NSString
        self.urlToImage = dictionary["urlToImage"] as? NSString
        self.publishedAt = self.parseDate(publishedAt: (dictionary["publishedAt"] as? NSString)!)
    }
    
    public func parseDate(publishedAt : NSString) -> NSString {
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: publishedAt as String)!
        dateFormatter.dateFormat = "dd MMM yyyy hh:mm a"
        dateFormatter.timeZone = NSTimeZone(name: "IST") as TimeZone!
        let dateString = dateFormatter.string(from: date)
        
//        print("EXACT_DATE : \(dateString)")
        return dateString as NSString
    }
    
    override var description : String {
        return "author : \(self.author!)\n title : \(self.title!)\n description : \(self.newsdescription!)\n url : \(self.url!)\n urlToImage : \(self.urlToImage!)\n publishedAt : \(self.publishedAt!)"
    }
    
}
