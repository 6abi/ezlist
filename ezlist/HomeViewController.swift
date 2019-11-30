//
//  HomeViewController.swift
//  ezlist
//
//  Created by Apple Developer Academy on 30/11/19.
//  Copyright © 2019 Apple Developer Academy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let reuseIdentifier = "EzListCell"

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var collectionCells: [String] = [String]()
    var largura: CGFloat?
    var altura: CGFloat?
    var x: CGFloat?
    var y: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Delegando as responsabilidades ao ViewControllerself.myCollectionView.dataSource = self
        largura = 83/414 * view.frame.size.width
        altura = 42/768 * view.frame.size.height
        x = 83.5/414 * view.frame.size.width
        y = 104/768 * view.frame.size.height
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.register(UINib.init(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionCells = ["Churrasco","Festa","Minhas listas"]
    }
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let choice = self.collectionCells[indexPath.row]
        
        switch choice {
        case "Churrasco":
            let vc = storyboard?.instantiateViewController(identifier: "ChurrascoVC")
            vc?.modalPresentationStyle = .currentContext
            self.present(vc!, animated: true, completion: nil)
            break
        case "Festa":
            let vc = storyboard?.instantiateViewController(identifier: "festaVC")
            vc?.modalPresentationStyle = .currentContext
            self.present(vc!, animated: true, completion: nil)
            break
        case "Minhas listas":
            
            break
        default:
            print("Errooou")
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CellView
        
        cell.configure(with: self.collectionCells[indexPath.row])
        // Configure the cell
        cell.lbl.frame.size.width = largura!
        cell.lbl.frame.size.height = altura!
        cell.lbl.frame.origin.x = x!
        cell.lbl.frame.origin.y = y!
        return cell
    }
    
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return CGSize(width: 250, height: 150)
    }
}
