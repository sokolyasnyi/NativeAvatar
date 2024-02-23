//
//  CustomLargeTitleNavigationBar.swift
//  NativeAvatar
//
//  Created by Станислав Соколов on 23.02.2024.
//

import UIKit

class CustomLargeTitleNavigationBar: UINavigationBar {
    

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        if #available(iOS 11.0, *) {
            for subview in subviews {
                if let largeTitleLabel = subview.subviews.first(where: { $0 is UILabel }) as? UILabel {
                    let largeTitleView = subview
                    print("largeTitleView:", largeTitleView)
                    print("largeTitleLabel:", largeTitleLabel)
                    // you may customize the largeTitleView and largeTitleLabel here
                    break
                }
            }
        }
    }
}
