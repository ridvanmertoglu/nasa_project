//
//  ViewController.swift
//  nasa_project
//
//  Created by ridvan.mertoglu on 16.05.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet private weak var photosCollectionView: UICollectionView!
    private lazy var viewModel = PhotoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollectionView()
        viewModel.fetchPictures()
        
       
    }
    
    private func prepareCollectionView() {
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        photosCollectionView.register(cellType: PhotoCollectionViewCell.self)
        self.photosCollectionView.reloadData()
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.photoList?.photos.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: PhotoCollectionViewCell.self, indexPath: indexPath)
                if let photo = self.viewModel.photoList?.photos[indexPath.item] {
                    cell.nameLabel.text = photo.rover.name
        }
                return cell
    }
    
    
}

