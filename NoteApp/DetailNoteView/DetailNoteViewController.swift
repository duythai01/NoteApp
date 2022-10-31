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
        
        
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.layer.cornerRadius = 15
        let selectedRange: UITextRange? = textView.selectedTextRange
        return textView
    }()

    func insertImageToTextView(photo: UIImage){
        let attachment = NSTextAttachment()
        attachment.image = UIImage.scaleImageToSize(img: photo, size: CGSize(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2.5))
        let imageString = NSAttributedString(attachment: attachment)
        let indexText = textView.text.endIndex
        print(indexText)
        textView.textStorage.insert(imageString, at: 0)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("note chon \(labelTextView.text ?? "")")
        print("id note chon \(idNote)")
        if self.isMovingFromParent {
            Note.updateNote(id: idNote, label: labelTextView.text, content:  textView.text, img: "img")
            delegate?.updateNote()
        }
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
       }
    @objc func textFormat(sender: Any) {
           print("textFormat")
       }
    @objc func addList(sender: Any) {
           print("addList")
       }
    @objc func addImage(sender: Any) {
           print("addImage")
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
        
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
        picker.dismiss(animated: true)
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
    
}
