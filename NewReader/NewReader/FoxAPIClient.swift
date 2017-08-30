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

typealias APICompletion<T> = (APIResult<T>) -> Void

let APIKEY : String = "7b1568b218554e659e942bfed4c4e20d"

class FoxAPIClient: APIClient<AuthHeaders, ErrorResponse> {
	
	static let shared = FoxAPIClient()
	
	override init() {
		super.init()
		self.enableLogs = true
	}
	
	override func authenticationHeaders(response: HTTPURLResponse) -> AuthHeaders? {
		return try? AuthHeaders.parse(JSON(response.allHeaderFields))
	}
	
	class func getArticles(completion: @escaping APICompletion<ArticleResponse>) {
		let router = APIRouter.articles(source: "the-next-web", sortBy: "latest", apiKey: APIKEY)
		FoxAPIClient.shared.request(router: router, completion: completion)
	}
	
	class func getSources(completion: @escaping APICompletion<SourceResponse>) {
		let router = APIRouter.sources(language: "en")
		FoxAPIClient.shared.request(router: router, completion: completion)
	}
}
