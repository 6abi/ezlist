//
//  Produto.swift
//  ezlist
//
//  Created by Apple Developer Academy on 23/11/19.
//  Copyright © 2019 Apple Developer Academy. All rights reserved.
//

import UIKit

class Produto: Codable{
var nome: String
var qtd:Int
var tipo: String

init(nome:String, qtd:Int, tipo:String) {
    self.nome = nome
    self.qtd = qtd
    self.tipo = tipo
 }
}
