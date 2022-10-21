//
//  DetailNoteViewController.swift
//  NoteApp
//
//  Created by Apple on 16/10/2022.
//

import UIKit

class DetailNoteViewController: UIViewController  {
    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(#colorLiteral(red: 0.09046945721, green: 0.1104127243, blue: 0.1513906419, alpha: 1))
        textView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textView.textColor = UIColor(#colorLiteral(red: 0.5063894391, green: 0.5421293974, blue: 0.6122373939, alpha: 1))
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.layer.cornerRadius = 15
        return textView
    }()
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
        view.backgroundColor = . green
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension UITextView {
    
    func addDoneButton(listButton: [UIBarButtonItem]) {
        var test = [0,1,2,3,4,5,6,7]
        var test2:[Int] = []
        print(test)
        test.forEach { x in
            test2.append(x)
            test2.append(009998)
        }
        test.append(1000)
        print(test2)
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
//        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3
        print(listButton)
        var setButton: [UIBarButtonItem] = []
        setButton.append(flexible)
        listButton.forEach { btn in
            setButton.append(btn)
            setButton.append(flexible)
        }
        print(listButton)
        toolBar.setItems(setButton, animated: false)//4
        self.inputAccessoryView = toolBar//5
    }
}
