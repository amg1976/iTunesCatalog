//
//  Resource.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

/// Enum that declares possible values for http request methods
enum HttpMethod: CustomStringConvertible {
    case get
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}

/// Defines a resource corresponding to an API endpoint
struct Resource<T> {
    let httpMethod: HttpMethod
    let url: URL
    let parse: (Data) -> T?
}

extension Resource where T: Codable {
    
    /// Creates a Resource that knows how to parse Data into a Codable object
    ///
    /// - Parameters:
    ///   - url: the URL of the Resource
    ///   - httpMethod: the HTTPMethod needed to fetch the resource
    init(withUrl url: String, httpMethod: HttpMethod) {
        self.url = URL(string: url)!
        self.httpMethod = httpMethod
        self.parse = { data in
            return try? JSONDecoder().decode(T.self, from: data)
        }
    }
    
}

extension URLRequest {
    
    init<T>(withResource resource: Resource<T>) {
        self.init(url: resource.url)
        self.httpMethod = String(describing: resource.httpMethod)
    }
    
}
