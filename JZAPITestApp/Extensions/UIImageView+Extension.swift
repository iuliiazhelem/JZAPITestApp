//
//  UIImageView+Extension.swift
//  JZAPITestApp
//
//  Created by Iuliia Zhelem on 10/11/22.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
}
