//
//  ViewController.swift
//  Demo
//
//  Created by Raunak Sinha on 03/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    var iconClick = false
    var imageIcon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = loginButton.frame.size.height/2
        setUpIcon()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    //MARK: - EyeImage And Validation
    func setUpIcon(){
        
        imageIcon.image = UIImage(systemName: "eye.slash")
        imageIcon.tintColor = .black
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        contentView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
        imageIcon.frame = CGRect(x: -10, y: 0, width: 25, height: 15)
        passwordTextField.rightView = contentView
        passwordTextField.rightViewMode = .always
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClick {
            iconClick = false
            tappedImage.image = UIImage(systemName: "eye")
            passwordTextField.isSecureTextEntry = false
        }
        else{
            iconClick = true
            tappedImage.image = UIImage(systemName: "eye.slash")
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    //MARK: - IBActions
    
    
    @IBAction func forgetPasswordTapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
        if let email = emailTextField.text {
            if isValidEmail(email) {
                if let _ = passwordTextField.text {
                    performSegue(withIdentifier: K.homeSegeue, sender: self)
                }else {
                    alert()
                }
            }else {
                alert()
            }
        }else {
            alert()
        }
    }
    
    
    func alert() {
        let dialogMessage = UIAlertController(title: "ERROR", message: "Wrong Details", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
        })
        
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
}

