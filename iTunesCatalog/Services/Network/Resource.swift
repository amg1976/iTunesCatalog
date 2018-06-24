//
//  Resource.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import Foundation

enum HttpMethod: CustomStringConvertible {
    case get
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}

struct Resource<T> {
    let httpMethod: HttpMethod
    let url: URL
    let parse: (Data) -> T?
}

extension Resource where T: Codable {
    
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
