//
//  Api.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 21/06/2018.
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

protocol NetworkServiceRepresentable {
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> Void)
}

class NetworkService: NetworkServiceRepresentable {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URLRequest(withResource: resource)) { (data, response, error) in
            let json = data.flatMap(resource.parse)
            completion(json)
        }
        
        task.resume()
        
    }
    
}

struct ListMovies: Codable {
    
    struct MovieFeed: Codable {
        var title: String
    }
    
    var feed: MovieFeed
}

func createListMoviesResource() -> Resource<ListMovies> {
    return Resource(withUrl: "https://rss.itunes.apple.com/api/v1/ie/movies/top-movies/all/50/explicit.json", httpMethod: .get)
}

class ClientApi {
    
    private var networkService: NetworkServiceRepresentable
    
    init(withNetworkService networkService: NetworkServiceRepresentable) {
        self.networkService = networkService
    }
    
    func getVideos(completion: @escaping (ListMovies?) -> Void) {
        networkService.load(resource: createListMoviesResource()) { result in
            completion(result)
        }
    }
    
}
