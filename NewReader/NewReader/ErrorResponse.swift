//
//  ErrorResponse.swift
//  NewReader
//
//  Created by Abhishek on 29/08/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit
import APIClient
import JSONParsing

private let errorKey = "error"

public struct ErrorModel: AnyError {
	public var code: Int
	public var domain: String
	public var message: String
}

public struct ErrorResponse: ErrorResponseProtocol {
	// Creating wrappper struct with conforming prtocol just LIKE FAVCY Project
	
	public var code: Int
	public let messages: [String]
	
	public var compiledErrorMessage: String {
		return self.messages.joined(separator: ",")
	}
	
	public var message: String {
		return self.compiledErrorMessage
	}
	
	public var domain: String {
		return "Error"
	}
	
	
	public static func parse(_ json: JSON, code: Int) throws -> ErrorResponse {
		
		let error = ErrorModel(code: code, domain: "Error", message: "Error Response can't Mapped")
		if json[errorKey] != JSON.null {
			return try ErrorResponse(code: code, messages: json[errorKey].arrayValue.map(^))
		} else {
			throw error
		}
	}

}
