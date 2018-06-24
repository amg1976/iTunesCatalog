//
//  JsonFileLoader.swift
//  iTunesCatalogTests
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

enum JsonFileLoader {
    
    static private func load(resource: String) -> String {

        guard let completePath = Bundle(for: ModelTests.self).path(forResource: resource, ofType: "json") else {
            fatalError("File not found")
        }
        
        let fileUrl = URL(fileURLWithPath: completePath)
        
        guard let fileContent = try? String(contentsOf: fileUrl) else {
            fatalError("Unabe to load file")
        }
        
        return fileContent
    }
    
    static func movies() -> String {
        return JsonFileLoader.load(resource: "list_movies")
    }

    static func songs() -> String {
        return JsonFileLoader.load(resource: "list_songs")
    }

    static func invalidResponse() -> String {
        return JsonFileLoader.load(resource: "invalid_response")
    }

    static func invalidFeed() -> String {
        return JsonFileLoader.load(resource: "invalid_feed")
    }
    
    static func invalidFeedItem() -> String {
        return JsonFileLoader.load(resource: "invalid_feed_item")
    }

}
