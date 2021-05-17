//
//  CustomeTableViewCell.swift
//  TestAPP
//
//  Created by Arjun on 05/02/21.
//

import UIKit

class CustomeTableViewCell: UITableViewCell {

    @IBOutlet weak var topCOllectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.topCOllectionView.register(UINib(nibName: "TabCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TabCollectionViewCell")
//        self.topCOllectionView.delegate = self
//        self.topCOllectionView.dataSource = self
//        self.topCOllectionView.reloadData()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
}
extension CustomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath as IndexPath) as? TabCollectionViewCell{
            cell.backgroundColor = .red
        return cell
        }
        return UICollectionViewCell()
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.topCOllectionView.frame.width/3 - 20 , height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
