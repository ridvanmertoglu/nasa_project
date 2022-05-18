//
//  UICollectionViewCellExtension.swift
//  nasa_project
//
//  Created by ridvan.mertoglu on 17.05.2022.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
