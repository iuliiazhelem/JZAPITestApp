//
//  InfoFetcher.swift
//  JZAPITestApp
//
//  Created on 10/9/22.
//

import Foundation

protocol InfoFetcher {
  func fetch(response: @escaping ([Animal]?) -> Void)
}
