//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Apple on 24/10/2022.
//

import UIKit
protocol addNoteDelegate {
    func addNote(newNote:Note)
}

class AddNoteViewController: UIViewController, UITextViewDelegate {
    var delegate: addNoteDelegate?
    let labelTextField :UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant:  UIScreen.main.bounds.height / 9).isActive = true
        textField.heightAnchor.constraint(equalToConstant:  60).isActive = true
//        textField.layer.cornerRadius = 10
        textField.placeholder = "Enter label"
    
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: textField.frame.height))
        textField.rightViewMode = .always
        
        
       
        textField.backgroundColor = .white
      
        textField.addTarget(self, action: #selector(labelTextFieldDidChanged), for: .editingChanged)
        textField.returnKeyType = .done
       
        return textField
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        textView.textColor = UIColor(#colorLiteral(red: 0.5063894391, green: 0.5421293974, blue: 0.6122373939, alpha: 1))
        textView.isScrollEnabled = true
        textView.isEditable = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
//        textView.layer.cornerRadius = 15
        return textView
    }()
    

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
       }
    @objc func pencil(sender: Any) {
           print("pencil")
       }
    @objc func labelTextFieldDidChanged() {
//          print(labelTextField.text ?? "")
      }
    
//    @objc func contentTextFieldDidChanged() {
//          print(contentTextField.text ?? "")
//      }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(labelTextField)
        view.addSubview(textView)
        let listButton:[UIBarButtonItem] = [UIBarButtonItem(image: UIImage(systemName: "tablecells"), style: .done, target: self, action: #selector(addTable(sender: ))),
                                            UIBarButtonItem(image: UIImage(systemName: "textformat"), style: .done, target: self, action: #selector(textFormat(sender: ))),
                                            UIBarButtonItem(image: UIImage(systemName: "checklist"), style: .done, target: self, action: #selector(addList(sender: ))),
                                            UIBarButtonItem(image: UIImage(systemName: "camera"), style: .done, target: self, action: #selector(addImage(sender: ))),
                                            UIBarButtonItem(image: UIImage(systemName: "pencil.tip.crop.circle"), style: .done, target: self, action: #selector(pencil(sender: ))),
//                                            UIBarButtonItem(title: "Xong", style: .plain, target: self, action: #selector(tapDone(sender: )))
        ]
        textView.delegate = self
        labelTextField.delegate = self
        self.textView.addDoneButton(listButton: listButton)
       
        NSLayoutConstraint.activate([
            
            labelTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            textView.topAnchor.constraint(equalTo: labelTextField.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
        
        configNavbar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            if ( textView.text != "" ||  labelTextField.text != ""){
                let new = Note.insertNewNote(content: textView.text!, createdDate: Date(), id: 4, image: "ấ", label: labelTextField.text!)
                
                print(new?.label)
                   print("save note")
                delegate?.addNote(newNote: new!)
            }
        }
    }
    
    @objc func saveNote(sender: Any) {
//        Note.addNewNote(content: textView.text!, createdDate: Date(), id: 4, image: "ấ", label: labelTextField.text!)
       
       
        self.view.endEditing(true)
        
       }
    private func configNavbar(){


        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(saveNote(sender: )))
        navigationItem.title = "Add Note"
        navigationItem

    }
    
    
 
}





extension AddNoteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text {
            print(text)
        }
        return true
    }
}
