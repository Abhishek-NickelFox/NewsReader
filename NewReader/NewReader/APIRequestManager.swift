//
//  APIRequestManager.swift
//  NewReader
//
//  Created by Abhishek on 29/08/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import APIClient

class APIRequestManager: RequestManager {

	static let shared = APIRequestManager()
	
	init() {
		super.init(baseUrl: URL(string: "https://newsapi.org")!)
		self.headers = ["Content-Type": "application/json"]
	}
	
}
