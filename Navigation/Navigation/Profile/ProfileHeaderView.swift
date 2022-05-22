//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Valentin Mashutin on 11.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    lazy var addView: UIView = {
        let view = UIView (frame: CGRect(x: 10, y: 10, width: 200, height: 200))
        view.center = self.addView.center
        view.backgroundColor = .red
        return addView
    }()
}
