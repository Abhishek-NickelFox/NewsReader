//
//  NewsResponse.swift
//  NewReader
//
//  Created by Abhishek on 29/08/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import JSONParsing

public struct URLLogos: JSONParseable {
	
	public var small: String
	public var medium: String
	public var large: String
	
	public static func parse(_ json: JSONParsing.JSON) throws -> URLLogos {
		return try URLLogos(small: json["small"]^,
							medium: json["medium"]^,
							large: json["large"]^)
	}
}

public struct Source {
	public var id: String
	public var name: String
	public var sourceDescription : String
	public var url: String
	public var category: String
	public var language: String
	public var country: String
	public var urlsToLogos: URLLogos
	public var sortBysAvailable: [String]
}

extension Source: JSONParseable {
	
	public static func parse(_ json: JSONParsing.JSON) throws -> Source {
	
		return try Source(id: json["id"]^,
						name: json["name"]^,
						sourceDescription: json["description"]^,
						url: json["url"]^,
						category: json["category"]^,
						language: json["language"]^,
						country: json["language"]^,
						urlsToLogos: json["urlsToLogos"]^,
						sortBysAvailable: json["sortBysAvailable"]^^)
	}

}

public struct SourceResponse: JSONParseable {
	
	public var sources: [Source]
	
	public static func parse(_ json: JSONParsing.JSON) throws -> SourceResponse {
		return try SourceResponse(sources: json["sources"]^^)
	}
}

// ARTICLES

public struct Article {
	public var author: String
	public var title: String
	public var newsdescription : String
	public var url: String
	public var urlToImage: String
	public var publishedAt: String
}

extension Article: JSONParseable {
	
	public static func parse(_ json: JSONParsing.JSON) throws -> Article {
		
		return try Article(author: json["author"]^,
		                  title: json["title"]^,
		                  newsdescription: json["description"]^,
		                  url: json["url"]^,
		                  urlToImage: json["urlToImage"]^,
		                  publishedAt: json["publishedAt"]^)
	}
	
}

public struct ArticleResponse: JSONParseable {
	
	public var articles: [Article]
	
	public static func parse(_ json: JSONParsing.JSON) throws -> ArticleResponse {
		return try ArticleResponse(articles: json["articles"]^^)
	}
}






