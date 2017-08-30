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
	case articles(source: String , sortBy: String, apiKey: String)
	case sources(language: String)
	
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
		case .articles(let source , let sortBy, let apiKey):
			var param: [String: Any] = [:]
			param["apiKey"] = apiKey
			param["sortBy"] = sortBy
			param["source"] = source
			return param
		case .sources(let language):
			return ["language": language]
		}
	}

	var path: String {
		switch self {
		case .demo:
			return "/get"
		case .articles:
			return "/v1/articles"
		case .sources:
			return "/v1/sources"
		}
	}

	var method: HTTPMethod {
		switch self {
		case .demo:
			return .post
		case .articles, .sources:
			return .get
		}
	}
	
}
