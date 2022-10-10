//
//  AnimalFetcher.swift
//  JZAPITestApp
//
//  Created on 10/9/22.
//

import Foundation

struct AnimalFetcher: InfoFetcher {
  let networking: Networking
  
  init(networking: Networking) {
    self.networking = networking
  }
  
  func fetch(response: @escaping ([Animal]?) -> Void) {
    networking.request(from: InterestingInfo.animals) { data, error in
      if let error = error {
        print("Error received requesting Bitcoin price: \(error.localizedDescription)")
        response(nil)
      }
      
      let decoded = self.decodeJSON(type: [Animal].self, from: data)
      if let decoded = decoded {
        print("Animals returned: \(decoded.count)")
      }
      response(decoded)
    }
  }
  
  private func decodeJSON<T: Decodable>(type: [T].Type, from: Data?) -> [T]? {
    let decoder = JSONDecoder()
    guard let data = from,
      let response = try? decoder.decode(type.self, from: data) else { return nil }
    
    return response
  }
}
