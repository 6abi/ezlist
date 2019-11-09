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
        self.myCollectionView.register(UINib.init(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionCells = ["Churrasco","Festa","Minhas listas"]
    }
    
    @IBAction func btnOnClick(_ sender: Any) {
        collectionCells.append( "Cell \(self.collectionCells.count + 1)")
        myCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CellView
        //cell.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        //cell.lbl.text = "Banans"
        cell.configure(with: self.collectionCells[indexPath.row])
        // Configure the cell
        return cell
    }
    
    
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 150)
    }
    
}
