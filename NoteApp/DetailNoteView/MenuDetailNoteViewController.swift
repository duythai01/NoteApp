//
//  MenuDetailNoteViewController.swift
//  NoteApp
//
//  Created by Apple on 20/10/2022.
//

import UIKit

class MenuDetailNoteViewController: UIViewController {
    
    let deleteNoteBTN:UIButton = {
        let btn = UIButton()
//        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        btn.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(
            pointSize: 32, weight: .medium, scale: .default)
        btn.setImage(UIImage(systemName: "x.circle.fill", withConfiguration: config), for: .normal)
        btn.tintColor = .white
        btn.widthAnchor.constraint(equalToConstant: 32).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btn.layer.cornerRadius = 16
        btn.clipsToBounds = true
//        btn.backgroundColor = .blue
        
        btn.addTarget(self, action: #selector(deleteNote(_:)), for: .touchUpInside)
        return btn
    }()
    let fucntionStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.heightAnchor.constraint(equalToConstant: 80).isActive = true
        sv.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true
        sv.addBackground(color: .black)
        sv.distribution = .equalSpacing
        return sv
    }()
    
    let shareStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6).isActive = true
        sv.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true
        sv.addBackground(color: .blue)
        sv.distribution = .equalSpacing
        return sv
    }()
    private func functionViewBtn( lb: String, selector: Selector, color: UIColor) {
        let pinImageView: UIImageView = {
            let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints = false
            let config = UIImage.SymbolConfiguration(
                pointSize:32, weight: .light, scale: .default)
            img.image = UIImage(systemName: lb, withConfiguration: config)
            img.tintColor = color
         
            return img
        }()
       
        let labelPin:UILabel = {
            let lb = UILabel()
            lb.translatesAutoresizingMaskIntoConstraints = false
            lb.text = "Pin"
            lb.textColor = color
            lb.font = .systemFont(ofSize: 16, weight: .light)
            return lb
        }()
        let functionButon: UIView  = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4.4).isActive = true
            view.backgroundColor = .white
            view.layer.cornerRadius = 12
            return view
        }()
        fucntionStackView.addArrangedSubview(functionButon)
        functionButon.addSubview(pinImageView)
        functionButon.addSubview(labelPin)
        let gesture = UITapGestureRecognizer(target: self, action: selector)
        functionButon.addGestureRecognizer(gesture)
        NSLayoutConstraint.activate([


            pinImageView.topAnchor.constraint(equalTo: functionButon.topAnchor, constant: 8),
            pinImageView.centerXAnchor.constraint(equalTo: functionButon.centerXAnchor),

            labelPin.centerXAnchor.constraint(equalTo: functionButon.centerXAnchor),
            labelPin.topAnchor.constraint(equalTo: pinImageView.bottomAnchor, constant: 5),
        ])
        
    }
    
    @objc func deleteNote(_ sender: UIButton){
        print("delete")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        view.addSubview(deleteNoteBTN)
        view.addSubview(fucntionStackView)
        view.addSubview(shareStackView)
        
        NSLayoutConstraint.activate([
//                deleteNoteBTN.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            deleteNoteBTN.topAnchor.constraint(equalTo: view.topAnchor, constant: 6),
            deleteNoteBTN.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
//                deleteNoteBTN.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            fucntionStackView.topAnchor.constraint(equalTo: deleteNoteBTN.bottomAnchor, constant: 22),
            fucntionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            fucntionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            shareStackView.topAnchor.constraint(equalTo: fucntionStackView.bottomAnchor, constant: 12),
            shareStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            shareStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
           

        ])
        functionViewBtn(lb: "doc.viewfinder", selector:  #selector(scanAction(_:)), color: .blue)
        functionViewBtn(lb: "pin.fill", selector:  #selector(pinAction(_:)),color: .orange)
        functionViewBtn(lb: "lock.fill", selector:  #selector(lockAction(_:)),color: .purple)
        functionViewBtn(lb: "trash", selector:  #selector(deleteAction(_:)), color: .red)

    }
    

    @objc func pinAction(_ sender:UITapGestureRecognizer){
        print("Pin")
    }
    @objc func scanAction(_ sender:UITapGestureRecognizer){
        print("Scans")
    }
    @objc func lockAction(_ sender:UITapGestureRecognizer){
        print("lock")
    }
    @objc func deleteAction(_ sender:UITapGestureRecognizer){
        print("delete")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        configFunctionBTN()
  
       
      
    }
    

}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
