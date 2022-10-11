//
//  ThemeViewController.swift
//  JZAPITestApp
//
//  Created on 10/11/22.
//

import Foundation
import UIKit

enum AppThemes {
    case dark, auto, light
    
    func systemTheme() -> UIUserInterfaceStyle {
        switch self {
        case .dark: return UIUserInterfaceStyle.dark
        case .light: return UIUserInterfaceStyle.light
        case .auto: return UIUserInterfaceStyle.unspecified
        }
    }
}

protocol ThemeDelegate {
    func changeTheme(_ theme: AppThemes)
}

class ThemeViewController: UIViewController {
    
    var themeDelegate: ThemeDelegate?
    
    @IBAction func AutoClickButton(_ sender: Any) {
        themeDelegate?.changeTheme(AppThemes.auto)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func darkClickButton(_ sender: Any) {
        themeDelegate?.changeTheme(AppThemes.dark)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func lightClickButton(_ sender: Any) {
        themeDelegate?.changeTheme(AppThemes.light)
        self.dismiss(animated: true, completion: nil)
    }
}
