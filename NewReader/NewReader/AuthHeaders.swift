//
//  AuthHeaders.swift
//  NewReader
//
//  Created by Abhishek on 29/08/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit
import APIClient
import JSONParsing

private let accessTokenKey = "acesss-token"

public struct AuthHeaders {
	
	let accessToken: String
	
	public static func parse(_ json: JSON) throws -> AuthHeaders {
		return try AuthHeaders(accessToken: json[accessTokenKey]^)
	}
}

//MARK: OVERRIDED FUNCTIONS AND VARAIBLES

extension AuthHeaders: AuthHeadersProtocol {
	
	public var isValid: Bool {
		return !self.accessToken.isEmpty
	}
	
	public func toJSON() -> [String : String] {
		let dict: [String: String] = [accessTokenKey: self.accessToken]
		return dict
	}
	
	public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
		var request = urlRequest
		request.setValue(self.accessToken, forHTTPHeaderField: "Access-Token")
		return request
	}
}
