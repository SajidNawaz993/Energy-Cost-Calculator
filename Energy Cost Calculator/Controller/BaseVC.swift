//
//  BaseVC.swift
//  Energy Cost Calculator
//
//  Created by Sajid Nawaz on 03/08/2022.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // ------------------------------------------------
    // MARK: Custom method
    // ------------------------------------------------
    
    func showTost(strMsg: String){
        let toastLabel = ToastLabel()
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        toastLabel.numberOfLines = 0
        toastLabel.font = UIFont(name: "Poppins-Regular", size:14)
        self.view.addSubview(toastLabel)
        toastLabel.text = strMsg
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        toastLabel.textInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        let saveArea = view.safeAreaLayoutGuide
        toastLabel.centerXAnchor.constraint(equalTo: saveArea.centerXAnchor, constant: 0).isActive = true
        toastLabel.leadingAnchor.constraint(greaterThanOrEqualTo: saveArea.leadingAnchor, constant: 15).isActive = true
        toastLabel.trailingAnchor.constraint(lessThanOrEqualTo: saveArea.trailingAnchor, constant: -15).isActive = true
        toastLabel.bottomAnchor.constraint(equalTo: saveArea.bottomAnchor, constant: -30).isActive = true
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
    }
}
