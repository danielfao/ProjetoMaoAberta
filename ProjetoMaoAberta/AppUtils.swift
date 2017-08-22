//
//  AppUtils.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Fernandes on 2017-08-20.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

func setProfileCircleImageView(image: UIImageView) -> UIImageView {
    image.layer.cornerRadius = image.frame.size.width / 2
    image.clipsToBounds = true
    
    image.layer.borderWidth = 3.0
    image.layer.borderColor = UIColor.white.cgColor
    
    return image
}
