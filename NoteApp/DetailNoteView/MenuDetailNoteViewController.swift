//
//  MenuDetailNoteViewController.swift
//  NoteApp
//
//  Created by Apple on 20/10/2022.
//

import UIKit

enum borderView {
    case top
    case mid
    case bottom
 
}

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
//        sv.addBackground(color: .black)
        sv.distribution = .equalSpacing
        return sv
    }()
    
    let shareStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 7).isActive = true
        sv.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true
//        sv.addBackground(color: .blue)
        sv.spacing = 1
        sv.distribution = .equalSpacing
        return sv
    }()
   
    let otherStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3.2).isActive = true
        sv.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true
//        sv.addBackground(color: .blue)
        sv.spacing = 1
        sv.distribution = .equalSpacing
        return sv
    }()
    
    private func functionViewBtn( lb: String, icon: String, selector: Selector, color: UIColor) {
        let pinImageView: UIImageView = {
            let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints = false
            let config = UIImage.SymbolConfiguration(
                pointSize:32, weight: .light, scale: .default)
            img.image = UIImage(systemName: icon, withConfiguration: config)
            img.tintColor = color
         
            return img
        }()
       
        let labelPin:UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = lb
            label.textColor = color
            label.font = .systemFont(ofSize: 16, weight: .light)
            return label
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
    
    private func shareViewBtn(lb: String, icon: String, selector: Selector, color: UIColor, check: Bool){
        let iconImageView: UIImageView = {
            let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints = false
            let config = UIImage.SymbolConfiguration(
                pointSize:28, weight: .light, scale: .default)
            img.image = UIImage(systemName: icon, withConfiguration: config)
            img.tintColor = color
         
            return img
        }()
       
        let labelView:UILabel = {
            let lable = UILabel()
            lable.translatesAutoresizingMaskIntoConstraints = false
            lable.text = lb
            lable.textColor = color
            lable.font = .systemFont(ofSize: 17, weight: .light)
            return lable
        }()
        let functionButon: UIView  = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.height / 14) - 1).isActive = true
            
            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true
            view.backgroundColor = .white
            view.clipsToBounds = true
            view.layer.cornerRadius = 10
            if (check){
                view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            }else{
                view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            }
            
            return view
        }()
        shareStackView.addArrangedSubview(functionButon)
        functionButon.addSubview(iconImageView)
        functionButon.addSubview(labelView)
        let gesture = UITapGestureRecognizer(target: self, action: selector)
        functionButon.addGestureRecognizer(gesture)
        NSLayoutConstraint.activate([


            iconImageView.trailingAnchor.constraint(equalTo: functionButon.trailingAnchor, constant: -8),
            iconImageView.centerYAnchor.constraint(equalTo: functionButon.centerYAnchor),

            labelView.centerYAnchor.constraint(equalTo: functionButon.centerYAnchor),
            labelView.leadingAnchor.constraint(equalTo: functionButon.leadingAnchor, constant: 8),
        ])
    }
    
    private func otherViewBtn(lb: String, icon: String, selector: Selector, color: UIColor, check: borderView){
        let iconImageView: UIImageView = {
            let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints = false
            let config = UIImage.SymbolConfiguration(
                pointSize:28, weight: .light, scale: .default)
            img.image = UIImage(systemName: icon, withConfiguration: config)
            img.tintColor = color
         
            return img
        }()
       
        let labelView:UILabel = {
            let lable = UILabel()
            lable.translatesAutoresizingMaskIntoConstraints = false
            lable.text = lb
            lable.textColor = color
            lable.font = .systemFont(ofSize: 17, weight: .light)
            return lable
        }()
        let functionButon: UIView  = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.height / 12.8) - 3).isActive = true
            
            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true
            view.backgroundColor = .white
            switch check {
                case .top:
                    
                    view.clipsToBounds = true
                    view.layer.cornerRadius = 10
                    view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
                    break
                case .mid:
                    break
                case .bottom:
                    view.clipsToBounds = true
                    view.layer.cornerRadius = 10
                    view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
                    break
            }
           
               
           
            
            return view
        }()
        otherStackView.addArrangedSubview(functionButon)
        functionButon.addSubview(iconImageView)
        functionButon.addSubview(labelView)
        let gesture = UITapGestureRecognizer(target: self, action: selector)
        functionButon.addGestureRecognizer(gesture)
        NSLayoutConstraint.activate([


            iconImageView.trailingAnchor.constraint(equalTo: functionButon.trailingAnchor, constant: -8),
            iconImageView.centerYAnchor.constraint(equalTo: functionButon.centerYAnchor),

            labelView.centerYAnchor.constraint(equalTo: functionButon.centerYAnchor),
            labelView.leadingAnchor.constraint(equalTo: functionButon.leadingAnchor, constant: 8),
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
        view.addSubview(otherStackView)

        
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
            
            otherStackView.topAnchor.constraint(equalTo: shareStackView.bottomAnchor, constant: 12),
            otherStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            otherStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
           

        ])
        functionViewBtn(lb: "Scan",icon: "doc.viewfinder", selector:  #selector(scanAction(_:)), color: .blue)
        functionViewBtn(lb: "Pin",icon: "pin.fill", selector:  #selector(pinAction(_:)),color: .orange)
        functionViewBtn(lb: "Lock",icon: "lock.fill", selector:  #selector(lockAction(_:)),color: .purple)
        functionViewBtn(lb: "Delete",icon: "trash", selector:  #selector(deleteAction(_:)), color: .red)
        
        shareViewBtn(lb: "Share note", icon: "person.crop.circle.badge.plus", selector:  #selector(shareNoteAction(_:)), color: .black, check: false)
        shareViewBtn(lb: "Send duplicate", icon: "square.and.arrow.up", selector:  #selector(sendDuplicateAction(_:)), color: .black, check: true)
        
        otherViewBtn(lb: "Search in note", icon: "magnifyingglass", selector:  #selector(searchAction(_:)), color: .black, check: .top)
        otherViewBtn(lb: "Move note", icon: "folder", selector:  #selector(moveNoteAction(_:)), color: .black, check: .mid)
        otherViewBtn(lb: "Line & net", icon: "tablecells", selector:  #selector(lineAndNetAction(_:)), color: .black, check: .mid)
        otherViewBtn(lb: "Print", icon: "printer", selector:  #selector(printAction(_:)), color: .black, check: .bottom)

    }
    
    // Function Action
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
    
    // Share Action
    @objc func shareNoteAction(_ sender:UITapGestureRecognizer){
        print("Share note")
    }
    @objc func sendDuplicateAction(_ sender:UITapGestureRecognizer){
        print("Send duplicate")
    }
    // Other Action
    @objc func searchAction(_ sender:UITapGestureRecognizer){
        print("Search in note")
    }
    @objc func moveNoteAction(_ sender:UITapGestureRecognizer){
        print("Move note")
    }
    @objc func lineAndNetAction(_ sender:UITapGestureRecognizer){
        print("Line & net")
    }
    @objc func printAction(_ sender:UITapGestureRecognizer){
        print("Print")
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
