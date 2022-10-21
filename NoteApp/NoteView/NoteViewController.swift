//
//  ViewController.swift
//  AnimationTest
//
//  Created by Apple on 14/09/2022.
//

import UIKit
import ViewAnimator

class ViewController: UIViewController, UISearchResultsUpdating  {

   
    
//    
   
    private let collectionView: UICollectionView = {
        let layout =  PinterestLayout()
        
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
////        layout.minimumInteritemSpacing = 5
////
////
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
//        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        

        collectionView.register(NoteCellCollectionViewCell.self, forCellWithReuseIdentifier: NoteCellCollectionViewCell.identifier)
      return collectionView
    }()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//              flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//            }
       
        
      
        view.addSubview(collectionView)
       
//        textViewHeightContraint = textView.heightAnchor.constraint(equalToConstant: 0)
//        containerViewWidthAnchor = containerView.widthAnchor.constraint(equalToConstant: 0)
       
        
        searchController.searchResultsUpdater = self
        collectionView.delegate = self
        collectionView.dataSource = self

        configNavbar()
        
        
    }
    
    var darkModeSwitch: UISwitch = {
        let darkMode = UISwitch()
        darkMode.isOn = false
      
        darkMode.onTintColor = .gray
        darkMode.tintColor = .black
        darkMode.layer.cornerRadius = darkMode.frame.height / 2.0
        darkMode.backgroundColor = .black
        return darkMode
    }()
    @objc func switchValueDidChange(sender: UISwitch!)
    {
        changeBackground()
    }
    func changeBackground() {
        if darkModeSwitch.isOn {
            print("on")
            self.collectionView.backgroundColor = .black
            navigationController?.navigationBar.tintColor = .white
            
            navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 24, weight: .bold), .foregroundColor: UIColor.white]
            return
           
        } else{
            print("off")
            self.collectionView.backgroundColor = .white
            navigationController?.navigationBar.tintColor = .black
            
            navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 24, weight: .bold), .foregroundColor: UIColor.black]
            return
        }
    }
    let searchController: UISearchController = {
        let search = UISearchController()
        return search
    }()
    func updateSearchResults(for searchController: UISearchController) {
        guard let text =  searchController.searchBar.text else{
            return
        }
        print(text)
    }
    
    private func configNavbar(){
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil)

        darkModeSwitch.addTarget(self, action: #selector(ViewController.switchValueDidChange(sender:)), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: darkModeSwitch)
        navigationItem.title = "NOTE"
        navigationItem.searchController = searchController
//        let attributes = [NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 6, weight: .bold)]
//        UINavigationBar.appearance().titleTextAttributes = attributes
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 24, weight: .bold), .foregroundColor: UIColor.black]
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.backgroundColor = .systemBlue
//        navigationController?.pushViewController(TitlePreviewViewController(), animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNeedsStatusBarAppearanceUpdate()

//        let animation = AnimationType.from(direction: .top, offset: 50)
//        UIView.animate(views: collectionView.visibleCells, animations: [animation], duration: 1)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      

        collectionView.frame = view.bounds
    }
    
    let imageName = ["1", "2", "3","4", "avatar", "fbLogo", "appleLogo", "googleLogo"]
    let noteList = ["If you don't do this the layout will call your implementation indefinitely and eventually crash. One solution is to cache the calculated size in your cell and invalidate this anytime you reuse the cell or change its content as I have done with the isHeightCalculated property.", "If you don't do this ll your implementation indefinitely f you don't do this ll your implementation indefinitely and eventually crashf you don't do this ll your implementation indefinitely and eventually crashf you don't do this ll your implementation indefinitely and eventually crashf you don't do this ll your implementation indefinitely and eventually crash and eventually crash. One solution is to cache the calculated size in your cell and invalidate this anytime you reuse the cell or change its content as I have done with the isHeightCalculated property.","If you don't do this the layout will call your implementation indefinitely and eventually crash. One solution is to cache the calculated size in your cell and invalidate this anytime you reuse the cell or change its content as I have done with the isHeightCalculated property.","If you don't do this the lad invalidate this anytime you reuse the cell or change its content as I have done with the isHeightCalculated property.","If you don't do this the layout will call your implementation indefinitely and eventually crash. One solution is to cache the calculated size in your cell and invalidate this anytime you reuse the cell or change its content as I have done with the isHeightCalculated property.","If you don't do this the layout will call your implementation indefinitely and eventually crash. One solution is to cache the calculated size in your cell and invalidate this anytime you reuse the cell or change itlated property.","If you don't do this the layout will call your implementation indefinitely and eventually crash. One solution is to cache the calculated size in your cell and invalidate this anytime you reuse the cell or change its content as I have done with the isHeightCalculated property.","If youculated size in your cell and invalidate this anytime you reuse the cell or change its content as I have done with the isHeightCalculated property.","If you don't do this the layout will call your implementatiois to cache the calculated size in your cell and invalidate this anytime you reuse the nge its content as I have done with the isHeightCalculated property."," the layout willll or change its content as I have done with the isHeightCalculated property.",]
  
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, PinterestLayoutDelegate{
  
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailNoteViewController()
        vc.navigationItem.title = noteList[indexPath.row]
        vc.textView.text = noteList[indexPath.row]

        
        navigationController?.pushViewController(vc, animated: true)
        
//        let vc = DetailNoteViewController()
//        let vc2 = UINavigationController(rootViewController: vc)
////        self.navigationController?.pushViewController(vc, animated: true)
//        vc2.modalPresentationStyle = .fullScreen
//        self.present(vc2, animated: true, completion: nil)
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCellCollectionViewCell.identifier, for: indexPath) as? NoteCellCollectionViewCell else { return UICollectionViewCell()}
       
        cell.textView.text = noteList[indexPath.row]
      
        cell.layer.cornerRadius = 12
        
        return cell
    }

 
    func collectionView(_ collectionView: UICollectionView, heightForTextViewIndexPath indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        let text = String(noteList[indexPath.row] )
        let topPadding = 6.0
        let bottomPadding = 4.0
        let textFont = UIFont.systemFont(ofSize: 17, weight: .medium)
        let textHeight = self.heightForText(for: text, with: textFont, width: width)
        let height = textHeight + topPadding + bottomPadding + 10

      
        return height
    }
    
    
    func heightForText(for text: String, with font: UIFont, width: CGFloat) -> CGFloat {
        let nssString = NSString(string: text)
        let maxHeight = CGFloat(collectionView.frame.height / 2)
        let textAttributes =  [NSAttributedString.Key.font: font]
        let boundingRect = nssString.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
    
}


