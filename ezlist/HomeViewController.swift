//
//  ViewController.swift
//  Lista Teste
//
//  Created by Apple Developer Academy on 26/10/19.
//  Copyright © 2019 Apple Developer Academy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
   private let reuseIdentifier = "EzListCell"

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var btnNewCell: UIButton!
    
    var collectionCells: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Delegando as responsabilidades ao ViewController
        self.myCollectionView.dataSource = self
        self.myCollectionView.delegate = self
        
        self.collectionCells = ["Cell 1"]
    }
    
    @IBAction func btnOnClick(_ sender: Any) {
           collectionCells.append( "Cell 2")
           myCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .black
        // Configure the cell
        
        return cell
    }
}

