//
//  SwinjectStoryboard+Extension.swift
//  JZAPITestApp
//
//  Created on 10/9/22.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {
  @objc class func setup() {
    defaultContainer.autoregister(Networking.self, initializer: HTTPNetworking.init)
    defaultContainer.autoregister(InfoFetcher.self, initializer: AnimalFetcher.init)
    defaultContainer.storyboardInitCompleted(InterestingInfoViewController.self) { resolver, controller in
      controller.fetcher = resolver ~> InfoFetcher.self
    }
  }
}
