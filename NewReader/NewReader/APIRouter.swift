//
//  APIRouter.swift
//  NewReader
//
//  Created by Abhishek on 29/08/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import APIClient

enum APIRouter: Router {
	
	case demo
	
	var keypathToMap: String? {
		return nil
	}

	var timeoutInterval: TimeInterval? {
		return nil
	}

	var encoding: URLEncoding? {
		return nil
	}

	var headers: [String: String] {
		return ["Content-Type": "application/json"]
	}

	var baseUrl: URL {
		return URL(string: "https://newsapi.org")!
	}

	var params: [String: Any] {
		switch self {
		case .demo:
			return [:]
		}
	}

	var path: String {
		switch self {
		case .demo:
			return "/get"
		}
	}

	var method: HTTPMethod {
		switch self {
		case .demo:
			return .get
		}
	}
	
}
