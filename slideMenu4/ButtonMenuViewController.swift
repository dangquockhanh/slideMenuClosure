//
//  ButtonMenuViewController.swift
//  slideMenu4
//
//  Created by Đặng Khánh  on 4/24/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

// Nên thay đổi tên cho delegate. Những delegate dùng cho màn hình nào thì nên naming hơn. Ví dụ như màn này là buttonMenu thì nên để delegate ButtonMenuViewControllerDelegate.
protocol Delegate {
    var showing: Bool { get set }
}

class ButtonMenuViewController: UIViewController {

    @IBOutlet weak var nameVc2: UILabel!
    @IBOutlet weak var AgeVc2: UILabel!
    @IBOutlet weak var photoInfo: UIImageView!
    
    var delegate: Delegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Nên tách ra func để có thể quản lý dễ hơn
    }
    func parseData(_ user: User?) {
        if let user = user {
            nameVc2.text = user.name
            AgeVc2.text = user.age
            photoInfo.image = UIImage(data: user.avatar ?? Data())
        }
    }
    
    @IBAction func buttonMenu(_ sender: Any) {
        delegate?.showing = true
    }
    
}
