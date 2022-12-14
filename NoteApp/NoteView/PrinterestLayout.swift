//
//  PrinterestLayout.swift
//  NoteApp
//
//  Created by Apple on 29/09/2022.
//

import UIKit
protocol PinterestLayoutDelegate: AnyObject {
//  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
    
    func collectionView(_ collectionView: UICollectionView, heightForTextViewIndexPath indexPath: IndexPath, with width: CGFloat) -> CGFloat
}

class PinterestLayout: UICollectionViewLayout {

  weak var delegate: PinterestLayoutDelegate?


  private let numberOfColumns = 2
  private let cellPadding: CGFloat = 6

 
  private var cache: [UICollectionViewLayoutAttributes] = []


  private var contentHeight: CGFloat = 0

  private var contentWidth: CGFloat {
    guard let collectionView = collectionView else {
      return 0
    }
    let insets = collectionView.contentInset
    return collectionView.bounds.width - (insets.left + insets.right)
  }


  override var collectionViewContentSize: CGSize {
    return CGSize(width: contentWidth, height: contentHeight)
  }
  
    
    
  override func prepare() {
  
    guard
      cache.isEmpty == true,
      let collectionView = collectionView
      else {
        return
    }
   
    let columnWidth = contentWidth / CGFloat(numberOfColumns)
    var xOffset: [CGFloat] = []
    for column in 0..<numberOfColumns {
      xOffset.append(CGFloat(column) * columnWidth)
    }
    var column = 0
    var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
      
    // 3 Loop through all the items in the first section since this particular layout has only one section.
    for item in 0..<collectionView.numberOfItems(inSection: 0) {
      let indexPath = IndexPath(item: item, section: 0)
        let width: CGFloat  = columnWidth - cellPadding * 2
        let noteHeight: CGFloat = (delegate?.collectionView(collectionView, heightForTextViewIndexPath: indexPath, with: width))!
        
        
        
        let height: CGFloat  = cellPadding + noteHeight
        
        let frame = CGRect(x: xOffset[column],
                         y: yOffset[column],
                         width: columnWidth,
                         height: height)
        
        let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = insetFrame
        cache.append(attributes)
        
        //update
        contentHeight = max(contentHeight, frame.maxY)
        yOffset[column] = yOffset[column] + height
        
        column = column < (numberOfColumns - 1) ? (column + 1) : 0

  }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
    
//      var layoutAtrributes = [UICollectionViewLayoutAttributes]()

    for attributes in cache {
      if attributes.frame.intersects(rect) {
        visibleLayoutAttributes.append(attributes)
      }
    }
    return visibleLayoutAttributes
  }
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return cache[indexPath.item]
  }
}
