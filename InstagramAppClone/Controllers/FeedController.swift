//
//  FeedController.swift
//  InstagramAppClone
//
//  Created by Ayodeji Ayankola on 5/14/21.
//

import UIKit

private let reuseAbleIdenfier = "Cell"


class FeedController: UICollectionViewController {
    
    //MARK:- Life Cycle
    override func viewDidLoad(){
        super.viewDidLoad()
        configureUI()
    }
    
    
    //MARK:- Helpers
    func configureUI() {
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseAbleIdenfier)
    }
}

//MARK:- UICollectionViewDataSource
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseAbleIdenfier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
}

//MARK:- UICollectionViewDelegateFlowLayout
extension FeedController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
