//
//  ProfileViewController.swift
//  slideMenu4
//
//  Created by Đặng Khánh  on 4/24/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit



class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    
    //    var delegates : ProfileViewControllerDelegate?
    var user: User?
    
    // Truyển data bằng closure. Còn cũng có thể truyền bằng delegate cũng đc
    internal var loginClosure: ((_ user: User?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAvatarImage()
    }
    
    /* Cái này là menu rồi nó k phải là trung gian giữa home và profile nên sẽ k truyền data từ đây theo cách này cần tìm hiều lại
    
//    // MARK: Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier ?? "" {
//        case "menu":
//            guard let menuVC = segue.destination as? ProfileViewController else {
//                return
//            }
//
//            user = User(avatar: (photo.image?.pngData())!, name: nameText.text!, age: ageText.text!)
//            menuVC.user = self.user
//        case "home":
////            guard let buttonMenuVc = segue.destination as? ViewController else {
////                return
////            }
//            break
//        default :
//            break
//        }
//
//    }
 
    */
    
    private func setupAvatarImage() {
        photo.layer.cornerRadius = photo.bounds.height / 2
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photo.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // Check các giá trị nhập vào menu cho theo yêu cầu như text phải có, image phải có....
    private func validationDateInput() -> Bool {
        guard let name = nameText.text, let age = ageText.text else {
            return false
        }
        
        if name.isEmpty || age.isEmpty {
            print("Mời nhập đầy đủ thông tin")
            return false
        }
        
        return true
    }
}

// MARK: - Actions
extension ProfileViewController {
    
    // K phải chức năng nó là login nhé. Chỉnh lại tên cho đúng chức năng
    @IBAction func loginButton(_ sender: Any) {
        if validationDateInput() {
            // truyền dữ liệu đi
            guard let imageData = photo.image?.pngData() else {
                return
            }
            user = User(avatar: imageData, name: nameText.text ?? "", age: ageText.text ?? "")
            loginClosure?(user)
        }
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
}


