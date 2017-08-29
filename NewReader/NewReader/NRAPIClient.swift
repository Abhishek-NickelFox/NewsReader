//
//  NRAPIClient.swift
//  NewReader
//
//  Created by Abhishek on 29/08/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import APIClient
import SwiftyJSON

class FoxAPIClient: APIClient<AuthHeaders, ErrorResponse> {
	
	static let shared = FoxAPIClient()
	
	override init() {
		super.init()
		self.enableLogs = true
	}
	
	override func authenticationHeaders(response: HTTPURLResponse) -> AuthHeaders? {
		return try? AuthHeaders.parse(JSON(response.allHeaderFields))
	}
	
}
