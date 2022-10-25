//
//  NoteCellCollectionViewCell.swift
//  NoteApp
//
//  Created by Apple on 24/09/2022.
//

import UIKit
protocol noteCellDelegate: class {
    func delete(noteCell: NoteCellCollectionViewCell)
}

class NoteCellCollectionViewCell: UICollectionViewCell {
  
    
    static let identifier = "NoteCellCollectionViewCell"
    weak var delegate: noteCellDelegate?
        
        let textView: UITextView = {
            let textView = UITextView()
            textView.backgroundColor = UIColor(#colorLiteral(red: 0.09046945721, green: 0.1104127243, blue: 0.1513906419, alpha: 1))
            textView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            textView.textColor = UIColor(#colorLiteral(red: 0.5063894391, green: 0.5421293974, blue: 0.6122373939, alpha: 1))
            textView.isScrollEnabled = false
            textView.isEditable = false
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.textContainer.lineBreakMode = .byTruncatingTail
            textView.layer.cornerRadius = 12
            return textView
        }()
        

    let deleteNoteBTN:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(
            pointSize: 22, weight: .medium, scale: .default)
        btn.setImage(UIImage(systemName: "x.circle.fill", withConfiguration: config), for: .normal)
        btn.tintColor = .white
        btn.widthAnchor.constraint(equalToConstant: 22).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 22).isActive = true
        btn.layer.cornerRadius = 11
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(deleteNote(_:)), for: .touchUpInside)
        return btn
    }()
    
    @objc func deleteNote(_ sender: UIButton){
        delegate?.delete(noteCell: self )
        
        print("delete")
    }
    let noteLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Day la lable "
        lb.font = .systemFont(ofSize: 20, weight: .bold)
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lb.lineBreakMode = .byTruncatingTail
//        lb.backgroundColor = .green
        return lb
    }()
   
    var stackView: UIStackView = UIStackView()
    
 
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.backgroundColor = UIColor(#colorLiteral(red: 0.09046945721, green: 0.1104127243, blue: 0.1513906419, alpha: 1))
            contentView.addSubview(deleteNoteBTN)
            contentView.addSubview(noteLabel)
            contentView.addSubview(textView)


            NSLayoutConstraint.activate([
                deleteNoteBTN.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
                deleteNoteBTN.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
                
                noteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
                noteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
                noteLabel.trailingAnchor.constraint(equalTo: deleteNoteBTN.leadingAnchor	, constant: -5),
               

                textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                textView.topAnchor.constraint(equalTo: noteLabel.bottomAnchor, constant: 4),
                textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            ])
            contentView.layer.cornerRadius = 12
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
}

