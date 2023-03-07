//
//  CardView.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 07/03/2023.
//

import Foundation

import UIKit

@IBDesignable
class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 10

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
    }

}
