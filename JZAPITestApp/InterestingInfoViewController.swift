//
//  InterestingInfoViewController.swift
//  JZAPITestApp
//
//  Created on 10/9/22.
//

import UIKit

class InterestingInfoViewController: UIViewController {

    var fetcher: InfoFetcher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestInfo()
    }
    
    private func requestInfo() {
      guard let fetcher = fetcher else { fatalError("Missing dependencies") }
      fetcher.fetch { response in
        guard let response = response else { return }
        
        DispatchQueue.main.async { [weak self] in
//          self?.updateLabel(price: response.data)
        }
      }
    }


}

