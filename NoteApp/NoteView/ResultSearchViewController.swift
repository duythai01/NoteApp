//
//  SearchViewController.swift
//  NoteApp
//
//  Created by Apple on 27/10/2022.
//

import UIKit

class ResultSearchViewController: UIViewController {
    public var notes: [Note] = [Note]()
    
     public let searchResultCollectionView: UICollectionView = {
         let layout =  PinterestLayout()
         
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         

         collectionView.register(NoteCellCollectionViewCell.self, forCellWithReuseIdentifier: NoteCellCollectionViewCell.identifier)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
       return collectionView
     }()
    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = .red
        view.addSubview(searchResultCollectionView)
//        searchResultCollectionView.backgroundColor = .blue
        if let layout = searchResultCollectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        searchResultCollectionView.dataSource = self

    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        NSLayoutConstraint.activate([
            
            searchResultCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchResultCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            searchResultCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchResultCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
    

 

}

extension ResultSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, PinterestLayoutDelegate{
  
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailNoteViewController()
        vc.navigationItem.title = notes[indexPath.row].label
        vc.textView.text = notes[indexPath.row].content

        
        navigationController?.pushViewController(vc, animated: true)

    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCellCollectionViewCell.identifier, for: indexPath) as? NoteCellCollectionViewCell else { return UICollectionViewCell()}
//        print(notes[indexPath.row])
        cell.noteLabel.text = notes[indexPath.row].label!
        cell.textView.text = notes[indexPath.row].content

        cell.layer.cornerRadius = 12
        
        return cell
    }

 
    func collectionView(_ collectionView: UICollectionView, heightForTextViewIndexPath indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        let text = String(notes[indexPath.row].content!)
        let topPadding = 6.0
        let bottomPadding = 4.0
        let textFont = UIFont.systemFont(ofSize: 17, weight: .medium)
        let textHeight = self.heightForText(for: text, with: textFont, width: width)
        let height = textHeight + topPadding + bottomPadding + 20

      
        return height
    }
    
    
    func heightForText(for text: String, with font: UIFont, width: CGFloat) -> CGFloat {
        let nssString = NSString(string: text)
        let maxHeight = CGFloat(searchResultCollectionView.frame.height / 2)
        let textAttributes =  [NSAttributedString.Key.font: font]
        let boundingRect = nssString.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
    
}
