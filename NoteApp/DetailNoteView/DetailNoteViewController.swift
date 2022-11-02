//
//  DetailNoteViewController.swift
//  NoteApp
//
//  Created by Apple on 16/10/2022.
//

import UIKit
protocol updateNoteDelegate {
    func updateNote()
}

class DetailNoteViewController: UIViewController {
    var delegate: updateNoteDelegate?
    var idNote:String = ""
    var labelTextView:  UITextView = {
        let textView = UITextView()
//        textView.backgroundColor = UIColor(#colorLiteral(red: 0.09046945721, green: 0.1104127243, blue: 0.1513906419, alpha: 1))
        textView.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.isEditable = true

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.layer.cornerRadius = 15
        return textView
    }()
   
    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(#colorLiteral(red: 0.09046945721, green: 0.1104127243, blue: 0.1513906419, alpha: 1))
        textView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textView.textColor = UIColor(#colorLiteral(red: 0.5063894391, green: 0.5421293974, blue: 0.6122373939, alpha: 1))
        textView.text = "Will attempt to recover by breaking constraint<NSLayoutConstraint:0x60000025fed0 'assistantView.top' V:[_UIRemoteKeyboardPlaceholderView:0x7f7f98881d80]-(0)-[TUISystemInputAssistantView:0x7f7f98844160]   (active)>Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger. The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful.2022-10-31 21:24:24.711772+0700 NoteApp[2149:47681] [HardwareKeyboard] -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:], failed to fetch device property for senderID (778835616971358209) use primary keyboard info instead."
        
//        textView.textStorage.addAttributes(textView.typingAttributes, range:  )
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.layer.cornerRadius = 15
        let selectedRange: UITextRange? = textView.selectedTextRange
        return textView
    }()

    func insertImageToTextView(photo: UIImage){
        let photoWidth = photo.size.width
        let photoHeight = photo.size.height
        
        var heightNeeded: Float = Float(UIScreen.main.bounds.height / 2)
        var widthNeeded: Float = Float((UIScreen.main.bounds.width - 40))
        
//        var scaleWidth: Float = 1.0
//        var scaleHeight: Float = 1.0
//
//        let widthHeightRatio: Float = Float(photoWidth / photoHeight)
//
//        if (photoWidth > (UIScreen.main.bounds.width - 40) && photoHeight < UIScreen.main.bounds.height / 2 ) {
//            scaleWidth =  Float(photoWidth) / Float((UIScreen.main.bounds.width - 40))
//            widthNeeded = widthNeeded * scaleWidth
//            heightNeeded = Float(photoHeight)
//        }else {
//            widthNeeded = Float(photoWidth)
//            heightNeeded = Float(photoHeight)
//        }
      
        
        print(photo.size.width)
        print(photo.size.height)
        let attachment = NSTextAttachment()
//        attachment.image = UIImage.scaleImageToSize(img: photo, size: CGSize(width: CGFloat(widthNeeded), height: CGFloat(widthNeeded)))
        attachment.image = photo.imageResized(to:  CGSize(width: CGFloat(widthNeeded), height: CGFloat(widthNeeded)))
        let imageString = NSAttributedString(attachment: attachment)
        let indexText = textView.text.endIndex
        print(indexText)
        textView.textStorage.insert(imageString, at: getCursorTextView())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        super.viewWillDisappear(animated)
        print("note chon \(labelTextView.text ?? "")")
        print("id note chon \(idNote)")
        if self.isMovingFromParent {
            Note.updateNote(id: idNote, label: labelTextView.text, content:  textView.text, img: "img")
            delegate?.updateNote()
        }
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                             selector: #selector(keyboardWillShow(notification:)),
                                             name: UIResponder.keyboardWillShowNotification,
                                             object: nil)
        NotificationCenter.default.addObserver(self,
                                             selector: #selector(keyboardWillHide(notification:)),
                                             name: UIResponder.keyboardWillHideNotification,
                                             object: nil)
    }
@objc func keyboardWillShow(notification: NSNotification) {
    let userInfo: NSDictionary = notification.userInfo! as NSDictionary
    let keyboardInfo = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
    let keyboardSize = keyboardInfo.cgRectValue.size
    let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
    textView.contentInset = contentInsets
    textView.scrollIndicatorInsets = contentInsets
}

@objc func keyboardWillHide(notification: NSNotification) {
    textView.contentInset = .zero
    textView.scrollIndicatorInsets = .zero
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        configNavbar()
        let listButton:[UIBarButtonItem] = [UIBarButtonItem(image: UIImage(systemName: "tablecells"), style: .done, target: self, action: #selector(addTable(sender: ))),
                                            UIBarButtonItem(image: UIImage(systemName: "textformat"), style: .done, target: self, action: #selector(textFormat(sender: ))),
                                            UIBarButtonItem(image: UIImage(systemName: "checklist"), style: .done, target: self, action: #selector(addList(sender: ))),
                                            UIBarButtonItem(image: UIImage(systemName: "camera"), style: .done, target: self, action: #selector(addImage(sender: ))),
                                            UIBarButtonItem(image: UIImage(systemName: "pencil.tip.crop.circle"), style: .done, target: self, action: #selector(pencil(sender: ))),
                                            UIBarButtonItem(title: "Xong", style: .plain, target: self, action: #selector(tapDone(sender: )))
        ]
        self.textView.addDoneButton(listButton: listButton)
        

        // Do any additional setup after loading the view.
    }
    @objc func tapDone(sender: Any) {
           self.view.endEditing(true)
       }
    
    @objc func addTable(sender: Any) {
           print("add table")
//        getCursorTextView()
       }
    @objc func textFormat(sender: Any) {
           print("textFormat")
       }
    @objc func addList(sender: Any) {
           print("addList")
       }
    func getCursorTextView() -> Int {
      
        var curentCursor = 0
            
//        let selectedRange: UITextRange? = textView.selectedTextRange
//        print("day la selectedRTange: \(selectedRange)")
        if let selectedRange = textView.selectedTextRange {

            let cursorPosition = textView.offset(from: textView.beginningOfDocument, to: selectedRange.start)
            print(type(of: cursorPosition))
            print("\(cursorPosition)")
            curentCursor = cursorPosition
        }
        print(curentCursor)
            return curentCursor - 1
         
    }
    
    @objc func addImage(sender: Any) {
           print("addImage")
        let picker = UIImagePickerController()
        picker.delegate = self
        let actionSheet = UIAlertController(title: "Photo", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "camera", style: .default, handler: {
            (action:UIAlertAction) in
                //code
            picker.sourceType = .camera
            self.present(picker, animated: true)
           
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo", style: .default, handler: {
            (action:UIAlertAction) in
                //code
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true)
      
//        present(picker, animated: true)
        
       }
   
    @objc func pencil(sender: Any) {
           print("pencil")
       }
    
    @objc func menu(sender: Any) {
           print("menu")
        
        let menuVC = MenuDetailNoteViewController()
        menuVC.title = "Menu Detail"
        if let presentationController = menuVC.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large()] /// change to [.medium(), .large()] for a half *and* full screen sheet
               }
//        let menuVC = UINavigationController(rootViewController: )
        present(menuVC, animated: true)
//           navigationController?.pushViewController(MenuDetailNoteViewController(), animated: true)
       }
   
//    navigationController?.pushViewController(vc, animated: true)
    private func configNavbar(){
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .done, target: self, action: #selector(menu(sender: )))
        navigationItem.titleView = labelTextView

     
//        navigationItem.title = "dafadfgafasfafs"
//        let attributes = [NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 6, weight: .bold)]
//        UINavigationBar.appearance().titleTextAttributes = attributes
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 24, weight: .bold), .foregroundColor: UIColor.black]
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.backgroundColor = .systemBlue
//        navigationController?.pushViewController(TitlePreviewViewController(), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = . white
        NSLayoutConstraint.activate([
//
           

            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            textView.heightAnchor.constraint(equalToConstant: 300),
//            textView.widthAnchor.constraint(equalToConstant: 300)

        ])
    }

}

extension DetailNoteViewController:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{return}
         insertImageToTextView(photo: image)
        
        
    }
}

extension UITextView {
    
    func addDoneButton(listButton: [UIBarButtonItem]) {

        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
//        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3
//        print(listButton)
        var setButton: [UIBarButtonItem] = []
        setButton.append(flexible)
        listButton.forEach { btn in
            setButton.append(btn)
            setButton.append(flexible)
        }
//        print(listButton)
        toolBar.setItems(setButton, animated: false)//4
        self.inputAccessoryView = toolBar//5
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
          guard textField.text != nil else { return }
            textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)

      }
}

extension UIImage {
    
    
    class func scaleImageToSize(img: UIImage, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let point = CGPoint(x: 0,y :0)
        img.draw(in: CGRect(origin: point, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return scaledImage!
    }
    func imageResized(to target: CGSize) -> UIImage {
        let ratio = min(
                    target.height / size.height, target.width / size.width
                )
                let new = CGSize(
                    width: size.width * ratio, height: size.height * ratio
                )
                let renderer = UIGraphicsImageRenderer(size: new)
                return renderer.image { _ in
                    self.draw(in: CGRect(origin: .zero, size: new))
                }
        }
    
}
