//
//  ItemDetailViewModel+Extensions.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 07/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

extension ItemDetailViewModel {

    func getImage(onCompletion completion: @escaping (Result<UIImage>) -> Void) {
        clientApi.getImage(withId: self.id, url: self.imageUrl, completion: completion)
    }
    
}
