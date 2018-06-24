//
//  iTunesCatalogTests.swift
//  iTunesCatalogTests
//
//  Created by Adriano Goncalves on 19/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import XCTest

class ModelTests: XCTestCase {
    
    func testParseMovies() {
        let jsonMovies = JsonFileLoader.loadMovies()
        let moviesResource = ResourceFactory.createListMoviesResource()
        let list: ListResponse? = moviesResource.parse(jsonString: jsonMovies)
        
        XCTAssertNotNil(list)
        XCTAssertEqual(list!.feed.title, "Top Films")
        XCTAssertEqual(list!.feed.results.count, 50)
        
        let firstItem = list!.feed.results.first!
        XCTAssertEqual(firstItem.id, "1342077359")
        XCTAssertEqual(firstItem.name, "Black Panther (2018)")
        XCTAssertEqual(firstItem.url, "https://itunes.apple.com/ie/movie/black-panther-2018/id1342077359")
    }

    func testParseSongs() {
        let jsonSongs = JsonFileLoader.loadSongs()
        let songsResource = ResourceFactory.createListSongsResource()
        let list: ListResponse? = songsResource.parse(jsonString: jsonSongs)
        
        XCTAssertNotNil(list)
        XCTAssertEqual(list!.feed.title, "Today's Hits")
        XCTAssertEqual(list!.feed.results.count, 50)

        let firstItem = list!.feed.results.first!
        XCTAssertEqual(firstItem.id, "1331589486")
        XCTAssertEqual(firstItem.name, "Shotgun")
        XCTAssertEqual(firstItem.url, "https://itunes.apple.com/ie/album/shotgun/1331589118?i=1331589486&app=itunes")
        XCTAssertEqual(firstItem.artistName, "George Ezra")
        XCTAssertEqual(firstItem.collectionName, "Staying at Tamara's")
    }

}
