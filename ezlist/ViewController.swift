//
//  ViewController.swift
//  ezlist
//
//  Created by Apple Developer Academy on 26/10/19.
//  Copyright © 2019 Apple Developer Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula") as! Celula
        cell.lbl_item.text = lista[indexPath.row].nome
        
        cell.field_item.text = String( lista[indexPath.row].qtd)
       
        return cell
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!


    var carne: Produto?
    var cerveja: Produto?
    
    var lista: [Produto] = []
    
    override func viewDidLoad() {
        
        carne = Produto(nome: "Carne", qtd: 0)
        cerveja = Produto(nome: "Cerveja", qtd: 0)
        lista = [carne!, cerveja!]
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(colherTeclado)))
       
    }
    
    @objc func colherTeclado(){
        view.endEditing(false)
    }
}

class Produto{
    var nome: String
    var qtd:Int
    
    init(nome:String, qtd:Int) {
        self.nome = nome
        self.qtd = qtd
    }
}

class Celula:UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource{
    var nPicker: [Int] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(nPicker[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        field_item.text = "\(nPicker[row])"
        
        
    }
    @IBOutlet weak var lbl_item: UILabel!
    @IBOutlet weak var field_item: UITextField!
    
    override func awakeFromNib() {
        
        for i in 0...100{
            nPicker.append(i)
    }
        
        let pickerView = UIPickerView()
        
        field_item.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self

    }
    
    
}





