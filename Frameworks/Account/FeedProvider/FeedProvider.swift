//
//  FeedProvider.swift
//  FeedProvider
//
//  Created by Maurice Parker on 4/6/20.
//  Copyright © 2020 Ranchero Software, LLC. All rights reserved.
//

import Foundation
import RSCore
import RSParser

public enum FeedProviderAbility {
	case owner
	case available
	case none
}

public protocol FeedProvider  {
	
	/// Informs the caller of the ability for this feed provider to service the given URL
	func ability(_ urlComponents: URLComponents) -> FeedProviderAbility
	
	/// Provide the iconURL of the given URL
	func iconURL(_ urlComponents: URLComponents, completion: @escaping (Result<String, Error>) -> Void)
	
	/// Construct a Name for the new feed
	func assignName(_ urlComponents: URLComponents, completion: @escaping (Result<String, Error>) -> Void)
	
	/// Refresh all the article entries (ParsedItems)
	func refresh(_ webFeed: WebFeed, completion: @escaping (Result<Set<ParsedItem>, Error>) -> Void)
	
}
