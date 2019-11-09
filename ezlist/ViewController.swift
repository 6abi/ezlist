
import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Carnes"
        case 1:
            return "Bebidas"
        case 2:
            return "Acompanhamentos"
        case 3:
            return "Utilitários"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
              case 0:
                  return listaCarnes.count
              case 1:
                  return listaBebidas.count
              case 2:
                  return listaAcompanhamentos.count
              case 3:
                  return listaUtilitarios.count
              default:
                  return 0
              }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula") as! Celula
        print(indexPath.row)
        
        switch indexPath.section{
        case 0:
            cell.lbl_item.text = listaCarnes[indexPath.row].nome
            cell.field_item.text = String( listaCarnes[indexPath.row].qtd)
        case 1:
            cell.lbl_item.text = listaBebidas[indexPath.row].nome
            cell.field_item.text = String( listaBebidas[indexPath.row].qtd)
        case 2:
            cell.lbl_item.text = listaAcompanhamentos[indexPath.row].nome
            cell.field_item.text = String( listaAcompanhamentos[indexPath.row].qtd)
        case 3:
            cell.lbl_item.text = listaUtilitarios[indexPath.row].nome
            cell.field_item.text = String( listaUtilitarios[indexPath.row].qtd)
        default:
            break
        }
        return cell
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!

    //LISTA DE  ITEMS
    //CARNES
    var carneBovina: Produto?
    var carneSuina: Produto?
    var frango: Produto?
    //BEBIDAS
    var sucos: Produto?
    var refrigerantes: Produto?
    var bebidasAlcoolicas: Produto?
    //ACOMPANHAMENTOS
    var paoDeAlho:Produto?
    var paoFrances:Produto?
    var arroz:Produto?
    var salada:Produto?
    var maionese:Produto?
    var limao:Produto?
    var farofa:Produto?
    var temperos:Produto?
    //UTILITARIOS
    var alcool:Produto?
    var carvao:Produto?
    var fosforo:Produto?
    var copos:Produto?
    var talheres:Produto?
    var pratos:Produto?
    var guardanapos:Produto?
    var sacoDeLixo:Produto?
    
    //LISTAS DOS PRODUTOS
    var listaCarnes: [Produto] = []
    var listaBebidas: [Produto] = []
    var listaAcompanhamentos: [Produto] = []
    var listaUtilitarios: [Produto] = []
    
    override func viewDidLoad() {
        //CARNES
        carneBovina = Produto(nome: "Carne Bovina", qtd: 0, tipo: "Carnes")
        carneSuina = Produto(nome: "Carne Suína", qtd: 0, tipo: "Carnes")
        frango = Produto(nome: "Frango", qtd: 0, tipo: "Carnes")
        //BEBIDAS
        sucos = Produto(nome: "Sucos", qtd: 0, tipo: "Bebidas")
        refrigerantes = Produto(nome: "Refrigerantes", qtd: 0, tipo: "Bebidas")
        bebidasAlcoolicas = Produto(nome: "Bebidas Alcoólicas", qtd: 0, tipo: "Bebidas")
        //ACOMPANHAMENTOS
        paoDeAlho = Produto(nome: "Pão de Alho", qtd: 0, tipo: "Acompanhamentos")
         paoFrances = Produto(nome: "Pão Francês", qtd: 0, tipo: "Acompanhamentos")
         arroz = Produto(nome: "Arroz", qtd: 0, tipo: "Acompanhamentos")
         salada = Produto(nome: "Salada", qtd: 0, tipo: "Acompanhamentos")
         maionese = Produto(nome: "Maionese", qtd: 0, tipo: "Acompanhamentos")
         limao = Produto(nome: "Limão", qtd: 0, tipo: "Acompanhamentos")
         farofa = Produto(nome: "Farofa", qtd: 0, tipo: "Acompanhamentos")
         temperos = Produto(nome: "Temperos", qtd: 0, tipo: "Acompanhamentos")
        //UTILITARIOS
        alcool = Produto(nome: "Alcoól", qtd: 0, tipo: "Utilitários")
        carvao = Produto(nome: "Carvão", qtd: 0, tipo: "Utilitários")
        fosforo = Produto(nome: "Fósforo", qtd: 0, tipo: "Utilitários")
        copos = Produto(nome: "Copos", qtd: 0, tipo: "Utilitários")
        talheres = Produto(nome: "Talheres", qtd: 0, tipo: "Utilitários")
        pratos = Produto(nome: "Pratos", qtd: 0, tipo: "Utilitários")
        guardanapos = Produto(nome: "Guardanapos", qtd: 0, tipo: "Utilitários")
        sacoDeLixo = Produto(nome: "Saco de Lixo", qtd: 0, tipo: "Utilitários")
        
        

        listaCarnes = [carneBovina!, carneSuina!, frango!]
        listaBebidas = [sucos!, refrigerantes!, bebidasAlcoolicas!]
        listaAcompanhamentos = [paoDeAlho!, paoFrances!, arroz!, salada!, maionese!, limao!, farofa!, temperos!]
        listaUtilitarios = [alcool!, carvao!, fosforo!, copos!, talheres!, pratos!, guardanapos!, sacoDeLixo!]
        
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
    var tipo: String
    
    init(nome:String, qtd:Int, tipo:String) {
        self.nome = nome
        self.qtd = qtd
        self.tipo = tipo
    }
}
