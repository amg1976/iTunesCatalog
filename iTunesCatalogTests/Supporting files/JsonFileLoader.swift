//
//  JsonFileLoader.swift
//  iTunesCatalogTests
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

class JsonFileLoader {
    
    private var bundle: Bundle
    
    private func load(resource: String) -> String {

        guard let completePath = bundle.path(forResource: resource, ofType: "json") else {
            fatalError("File not found")
        }
        
        let fileUrl = URL(fileURLWithPath: completePath)
        
        guard let fileContent = try? String(contentsOf: fileUrl) else {
            fatalError("Unabe to load file")
        }
        
        return fileContent
    }
    
    init(withBundle bundle: Bundle = Bundle.main) {
        self.bundle = bundle
    }
    
    func movies() -> String {
        return load(resource: "list_movies")
    }

    func songs() -> String {
        return load(resource: "list_songs")
    }

    func invalidResponse() -> String {
        return load(resource: "invalid_response")
    }

    func invalidFeed() -> String {
        return load(resource: "invalid_feed")
    }
    
    func invalidFeedItem() -> String {
        return load(resource: "invalid_feed_item")
    }

}
