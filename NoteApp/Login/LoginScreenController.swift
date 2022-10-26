

//  LoginViewController.swift
//  AnimationTest
//
//  Created by Apple on 17/09/2022.
//

import UIKit
import ViewAnimator

class LoginScreenController: UIViewController {
    
   
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    let mainStackView:UIStackView  = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.backgroundColor = .purple
        return stackView
    }()
    //--------------------------------------------
    let spacingTopLogoView : UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant:  UIScreen.main.bounds.height * (1/3.2) * 0.6).isActive = true
//        view.backgroundColor = .red
        return view
    }()
    let spacingBottomLogoView : UIView  = {
        let view = UIView()
        return view
    }()
    let logoView:UIStackView  = {
        let stackView = UIStackView()
//        stackView.backgroundColor = .yellow
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.heightAnchor.constraint(equalToConstant:  UIScreen.main.bounds.height * (1/5)).isActive = true
        return stackView
    }()
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "login-")
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * (1/5) * 0.5).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * (1/5) * 0.5).isActive = true
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    //--------------------------------------------
    let spacingLoginView : UIView  = {
        let view = UIView()
        return view
    }()
    
    let spacingBottomLoginView : UIView  = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return view
    }()
    let loginView:UIStackView  = {
        let stackView = UIStackView()
//        stackView.backgroundColor = .red
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/3).isActive = true
        return stackView
    }()
    
    let userTextField :UITextField = {
        let textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width - 50).isActive = true
        textField.heightAnchor.constraint(equalToConstant:  60).isActive = true
        textField.layer.cornerRadius = 10
        textField.placeholder = "Nhập tài khoản"
    

        
        textField.setLeftView(UIImage(systemName: "person.fill")!, paddingLeft: 10, paddingRight: 20)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0.8
        textField.layer.borderColor = UIColor.black.cgColor
        textField.addTarget(self, action: #selector(userTextFieldDidChanged), for: .editingChanged)
        textField.returnKeyType = .done
       
        return textField
    }()
    @objc func userTextFieldDidChanged() {
          print(userTextField.text ?? "")
      }
  
    let passwordTextField :UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width - 50).isActive = true
        textField.returnKeyType = .done
        textField.heightAnchor.constraint(equalToConstant:  60).isActive = true
        textField.layer.cornerRadius = 10
        textField.placeholder = "Nhập mật khẩu"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0.8
        
        let frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "eye.fill")!.size.width + 20, height: UIImage(systemName: "eye.fill")!.size.height)
        let rightButton  = UIButton(type: .custom)
       
        
        rightButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        rightButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        rightButton.frame = CGRect(x:10, y:0, width:UIImage(systemName: "eye.fill")!.size.width , height:UIImage(systemName: "eye.fill")!.size.height)
        
        let iconView = UIView()
        iconView.addSubview(rightButton)
        iconView.tintColor = UIColor(#colorLiteral(red: 0.2273415923, green: 0.727404654, blue: 0.5573658347, alpha: 1))
        iconView.isUserInteractionEnabled = true
       

        
        iconView.frame = frame
        
        textField.rightViewMode = UITextField.ViewMode.always
        textField.rightView = iconView
      
        
        
        textField.isSecureTextEntry = true
        textField.setLeftView(UIImage(systemName: "lock.fill")!, paddingLeft: 10, paddingRight: 20)

        textField.backgroundColor = .white
        return textField
    }()
    

   
    @objc func hidePassword(button: UIButton){
        print("eee")
 
        passwordTextField.isSecureTextEntry.toggle()
            if passwordTextField.isSecureTextEntry {
                if let image = UIImage(systemName: "eye.fill") {
                    button.setImage(image, for: .normal)
                    button.tintColor = UIColor(#colorLiteral(red: 0.2273415923, green: 0.727404654, blue: 0.5573658347, alpha: 1))
                }
            } else {
                if let image = UIImage(systemName: "eye.slash.fill") {
                    button.setImage(image, for: .normal)
                    button.tintColor = UIColor(#colorLiteral(red: 0.2273415923, green: 0.727404654, blue: 0.5573658347, alpha: 1))
                }
            }
        
    }
    
    let forgetPasswordView:UIStackView = {
        let stackView = UIStackView()
        stackView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        stackView.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width - 50).isActive = true
//        stackView.alignment = .leading
//        stackView.backgroundColor = .white
        return stackView
    }()
    let forgetPassWordLabel:UILabel = {
        let lb = UILabel()
        lb.text = "Forget password"
        lb.textAlignment = .right
        lb.font = .systemFont(ofSize: 13, weight: .medium)
        lb.isUserInteractionEnabled = true
                
        return lb
    }()
   
    @objc func forgetPassWord(_ sender: Any){
        print("forget password")
    }
    let loginBTN:UIButton = {
        let btn = UIButton()
        btn.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width / 2).isActive = true
        btn.heightAnchor.constraint(equalToConstant:  60).isActive = true
        btn.backgroundColor = .white
        btn.setTitle("LOGIN", for: .normal)
        btn.addTarget(self, action: #selector(loginWithAccount(_:)), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 26, weight: .bold)
        btn.setTitleColor(UIColor(#colorLiteral(red: 0.2273415923, green: 0.727404654, blue: 0.5573658347, alpha: 1)), for: .normal)
        btn.layer.cornerRadius = 15
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        btn.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        btn.layer.shadowOpacity = 1.0
        btn.layer.shadowRadius = 0.0
        btn.layer.masksToBounds = false
        btn.layer.cornerRadius = 15
        return btn
    }()
    @objc func loginWithAccount(_ sender: UIButton){
        print("Login with Account")
        let vc = NoteViewController()
        let vc2 = UINavigationController(rootViewController: vc)
//        self.navigationController?.pushViewController(vc, animated: true)
        vc2.modalPresentationStyle = .fullScreen
        self.present(vc2, animated: true, completion: nil)
    }
    
    //--------------------------------------------
    let spacingSocialView : UIView  = {
        let view = UIView()
        return view
    }()
    
    let SocialLoginView:UIStackView  = {
        let stackView = UIStackView()
//        stackView.backgroundColor = .blue
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
  
    
    let facebookBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width / 1.6).isActive = true
        btn.heightAnchor.constraint(equalToConstant:  50).isActive = true

        btn.addTarget(self, action: #selector(loginWithFacebook(_:)), for: .touchUpInside)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.green, for: .normal)
        btn.setTitle("Login with facebook", for: .normal)
        btn.setImage(UIImage(named: "fbLogo"), for: .normal)
        btn.contentHorizontalAlignment = .leading
        btn.imageView?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0.6)
//        btn.imageView?.contentMode = .scaleAspectFit
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.cornerRadius = 15
        //        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        return btn
    }()
    
    @objc func loginWithFacebook(_ sender: UIButton) {
           print("Facebook")
       }
    
    let gooogleBtn:UIButton = {
        let btn = UIButton()
        btn.widthAnchor.constraint(equalToConstant:   UIScreen.main.bounds.width / 1.6).isActive = true
        btn.heightAnchor.constraint(equalToConstant:  50).isActive = true
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.green, for: .normal)
        btn.setTitle("Login with google", for: .normal)
        btn.setImage(UIImage(named: "googleLogo"), for: .normal)
        btn.contentHorizontalAlignment = .leading
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.imageView?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0.6)
        btn.addTarget(self, action: #selector(loginWithGoogle(_:)), for: .touchUpInside)
//        btn.imageView?.contentMode = .scaleAspectFit
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    @objc func loginWithGoogle(_ sender: UIButton) {
           print("google")
       }
    let appleBtn:UIButton = {
        let btn = UIButton()
        btn.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width / 1.6).isActive = true
        btn.heightAnchor.constraint(equalToConstant:  50).isActive = true
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.green, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(loginWithApple(_:)), for: .touchUpInside)
        btn.setTitle("Login with apple", for: .normal)
        btn.setImage(UIImage(named: "appleLogo"), for: .normal)
        btn.imageView?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0.6)
        btn.contentHorizontalAlignment = .leading

//        btn.imageView?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)

//        btn.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
//        btn.imageView?.contentMode = .scaleAspectFit
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    @objc func loginWithApple(_ sender: UIButton) {
           print("apple")
       }
    
    //--------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [
//            UIColor(#colorLiteral(red: 0.2273415923, green: 0.727404654, blue: 0.5573658347, alpha: 1)),
//            UIColor(#colorLiteral(red: 0.147623986, green: 0.5362576842, blue: 0.4610361457, alpha: 1))
//        ]
//        view.layer.addSublayer(gradientLayer)
        view.backgroundColor = UIColor(#colorLiteral(red: 0.2273415923, green: 0.727404654, blue: 0.5573658347, alpha: 1))
        view .addSubview(mainStackView)
        userTextField.delegate = self
        passwordTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animations:[Animation] = [
            AnimationType.from(direction: .left, offset: 300),
            AnimationType.rotate(angle: .pi)
        ]
//        AnimationType.from(direction: .left, offset: 300)
//        userTextField.animate(animations: animations, delay: 0, duration: 0.1)
//        passwordTextField.animate(animations: animations, delay: 0.8, duration: 0.2)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainStackView.frame = view.bounds
        setUpMainStackView()
    }
    

  
    func setUpMainStackView(){
            let mainStackViewConstraints = [
                mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
                mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
                mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 30)
            
            ]
          
            NSLayoutConstraint.activate(mainStackViewConstraints)
//        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
//
//
//        forgetPassWordLabel.addGestureRecognizer(guestureRecognizer)
        logoView.addArrangedSubview(spacingTopLogoView)
        logoView.addArrangedSubview(logoImage)
//        logoView.addArrangedSubview(spacingBottomLogoView)
        mainStackView.addArrangedSubview(logoView)
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(forgetPassWord(_:)))
        forgetPassWordLabel.addGestureRecognizer(labelTapGesture)

        loginView.addArrangedSubview(spacingLoginView)
        loginView.addArrangedSubview(userTextField)
        loginView.addArrangedSubview(passwordTextField)
        forgetPasswordView.addArrangedSubview(forgetPassWordLabel)
        loginView.addArrangedSubview(forgetPasswordView)
        loginView.addArrangedSubview(loginBTN)
        loginView.addArrangedSubview(spacingBottomLoginView)
        mainStackView.addArrangedSubview(loginView)
        
 
        SocialLoginView.addArrangedSubview(facebookBtn)
        SocialLoginView.addArrangedSubview(gooogleBtn)
        SocialLoginView.addArrangedSubview(appleBtn)
        SocialLoginView.addArrangedSubview(spacingSocialView)
        mainStackView.addArrangedSubview(SocialLoginView)
    }

}

extension LoginScreenController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text {
            print(text)
        }
        return true
    }
}

extension UITextField {
    func setLeftView(_ image: UIImage, paddingLeft: CGFloat, paddingRight: CGFloat) {
        let frame = CGRect(x: 0, y: 0, width: image.size.width + paddingRight, height: image.size.height)
            
        let leftImage = UIImageView()
        
        leftImage.image = image
        let iconView = UIView()
        iconView.addSubview(leftImage)
        iconView.tintColor = UIColor(#colorLiteral(red: 0.2273415923, green: 0.727404654, blue: 0.5573658347, alpha: 1))
        iconView.frame = frame
        leftImage.frame = CGRect(x: paddingLeft, y: 0, width: 25, height: 20)
        leftViewMode = UITextField.ViewMode.always
        leftView = iconView
      }
  
   
   
}
