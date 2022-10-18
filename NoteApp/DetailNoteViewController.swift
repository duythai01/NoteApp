//
//  DetailNoteViewController.swift
//  NoteApp
//
//  Created by Apple on 16/10/2022.
//

import UIKit

class DetailNoteViewController: UIViewController {
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
        
        print(UINavigationController.navBarHeight())
        // Do any additional setup after loading the view.
    }
    
    private func configNavbar(){
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil)

     
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


extension UINavigationController {
  static public func navBarHeight() -> CGFloat {
    let nVc = UINavigationController(rootViewController: UIViewController(nibName: nil, bundle: nil))
    let navBarHeight = nVc.navigationBar.frame.size.height
    return navBarHeight
  }
}
