//
//  ViewController.swift
//  slideMenu4
//
//  Created by Đặng Khánh  on 4/24/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Delegate {
    
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var backMenu: UIButton!
    @IBOutlet weak var leadingViewMenu: NSLayoutConstraint!
    
    // Khởi tạo user để chứa data từ menu truyền sang
    var user: User? {
        didSet {
            homeViewController.parseData(self.user)
        }
    }
    
    var showing: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.35, animations: {
                self.leadingViewMenu.constant = self.showing ? 0 : -self.viewMenu.bounds.width
                self.view.layoutIfNeeded()
            })
        }
    }
    
    var homeViewController = ButtonMenuViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showing = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Chú ý identifier phải giống với identifier khi mình set trong storyboard tương ứng với các màn.
        switch segue.identifier ?? "" {
        case "Home":
//            if segue.identifier == "Home" {
                guard let navViewController = segue.destination as? UINavigationController else {
                    return
                }
                
                guard let homeVC = navViewController.topViewController as? ButtonMenuViewController else {
                    return
                }
                self.homeViewController = homeVC
//            }
        case "Menu":
            guard let profileViewController = segue.destination as? ProfileViewController else {
                return
            }
            
            // Handle dữ liệu đc truyền về từ profile view controller
            profileViewController.loginClosure = { data in
                self.showing = false // Cho ẩn menu khi nhập gửi data
                self.user = data
            }
        default:
            break
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        showing = !showing
    }
    
}
