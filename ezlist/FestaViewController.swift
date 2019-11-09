
import UIKit

class FestaViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBAction func btn_salvar(_ sender: Any) {
        for item in listasGeral{
            DaoUserDefaults.save(lista: item.value, key:item.key)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Salgados"
        case 1:
            return "Doces"
        case 2:
            return "Bebidas"
        case 3:
            return "Decoração"
        case 4:
            return "Utensílios"
        case 5:
            return "Entretenimento"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
              case 0:
                  return listaSalgados.count
              case 1:
                  return listaDoces.count
              case 2:
                  return listaBebidas.count
              case 3:
                  return listaDecoracao.count
            case 4:
                return listaUtensilios.count
            case 5:
                return listaEntretenimento.count
              default:
                  return 0
              }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula") as! Celula
        print(indexPath.row)
        
        switch indexPath.section{
        case 0:
            cell.lbl_item.text = listaSalgados[indexPath.row].nome
            cell.field_item.text = String( listaSalgados[indexPath.row].qtd)
        case 1:
            cell.lbl_item.text = listaDoces[indexPath.row].nome
            cell.field_item.text = String( listaDoces[indexPath.row].qtd)
        case 2:
            cell.lbl_item.text = listaBebidas[indexPath.row].nome
            cell.field_item.text = String( listaBebidas[indexPath.row].qtd)
        case 3:
            cell.lbl_item.text = listaDecoracao[indexPath.row].nome
            cell.field_item.text = String( listaDecoracao[indexPath.row].qtd)
        case 4:
            cell.lbl_item.text = listaUtensilios[indexPath.row].nome
            cell.field_item.text = String( listaUtensilios[indexPath.row].qtd)
        case 5:
            cell.lbl_item.text = listaEntretenimento[indexPath.row].nome
            cell.field_item.text = String( listaEntretenimento[indexPath.row].qtd)
        default:
            break
        }
        return cell
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!

     //LISTA DE ITEMS
     //SALGADOS
    var miniPastel:Produto?
    var coxinha:Produto?
    var bolinhaDeQueijo:Produto?
    var miniPizza:Produto?
    var pipoca:Produto?
    var croquete:Produto?
    var empadinha:Produto?
    var tortaSalgada:Produto?

     
     //DOCES
    var brigadeiro:Produto?
     var bixoDePe:Produto?
     var beijinho:Produto?
     var balaDeCoco:Produto?
     var sorvete:Produto?
     var tortaDoce:Produto?
     var boloDeAniversario:Produto?
     
     //BEBIDAS
     var refrigerantes:Produto?
     var sucos:Produto?
     var bebidasAlcoolicas:Produto?
     
     //DECORACAO
     var centroDeMesa:Produto?
     var enfeiteDeParede:Produto?
     var baloes:Produto?
     
     //UTENSILIOS
     var velasParaBolo:Produto?
     var isqueiro:Produto?
     var facaDeBolo:Produto?
     var guardanapos:Produto?
     var pratos:Produto?
     var copos:Produto?
     var talheres:Produto?
     var toalhaDeMesa:Produto?
    

    //ENTRETENIMENTO
    var chapeis:Produto?
    var linguaDeSogra:Produto?
    var mascaras:Produto?
    
    
    //LISTAS DOS PRODUTOS
    var listaSalgados: [Produto] = []
    var listaDoces: [Produto] = []
    var listaBebidas: [Produto] = []
    var listaDecoracao: [Produto] = []
    var listaUtensilios: [Produto] = []
    var listaEntretenimento: [Produto] = []
    var listasGeral:[String:[Produto]] = [:]
    override func viewDidLoad() {
        //SALGADOS
        miniPastel = Produto(nome: "Mini-Pastel", qtd: 0, tipo: "Salgados")
        coxinha = Produto(nome: "Coxinha", qtd: 0, tipo: "Salgados")
        bolinhaDeQueijo = Produto(nome: "Bolinha de Queijo", qtd: 0, tipo: "Salgados")
         miniPizza = Produto(nome: "Mini-Pizza", qtd: 0, tipo: "Salgados")
        pipoca = Produto(nome: "Pipoca", qtd: 0, tipo: "Salgados")
        croquete = Produto(nome: "Croquete", qtd: 0, tipo: "Salgados")
         empadinha = Produto(nome: "Empadinha", qtd: 0, tipo: "Salgados")
        tortaSalgada = Produto(nome: "Torta Salgada", qtd: 0, tipo: "Salgados")
        
        //DOCES
        boloDeAniversario = Produto(nome: "Bolo de Aniversário", qtd: 0, tipo: "Doces")
         brigadeiro = Produto(nome: "Brigadeiro", qtd: 0, tipo: "Doces")
         bixoDePe = Produto(nome: "Bixo-de-Pé", qtd: 0, tipo: "Doces")
         beijinho = Produto(nome: "Beijinho", qtd: 0, tipo: "Doces")
         balaDeCoco = Produto(nome: "Bala de Coco", qtd: 0, tipo: "Doces")
         sorvete = Produto(nome: "Sorvete", qtd: 0, tipo: "Doces")
         tortaDoce = Produto(nome: "Torta Doce", qtd: 0, tipo: "Doces")
        
        //BEBIDAS
        refrigerantes = Produto(nome: "Refrigerantes", qtd: 0, tipo: "Bebidas")
        sucos = Produto(nome: "Sucos", qtd: 0, tipo: "Bebidas")
        bebidasAlcoolicas = Produto(nome: "Bebidas Alcoólicas", qtd: 0, tipo: "Bebidas")
        
        //DECORACAO
        centroDeMesa = Produto(nome: "Centro de Mesa", qtd: 0, tipo: "Decoração")
        enfeiteDeParede = Produto(nome: "Enfeite de Parede", qtd: 0, tipo: "Decoração")
        baloes = Produto(nome: "Balões", qtd: 0, tipo: "Decoração")
        
        //UTENSILIOS
        velasParaBolo = Produto(nome: "Velas para Bolo", qtd: 0, tipo: "Utensílios")
         isqueiro = Produto(nome: "Isqueiro", qtd: 0, tipo: "Utensílios")
         facaDeBolo = Produto(nome: "Faca de Bolo", qtd: 0, tipo: "Utensílios")
         guardanapos = Produto(nome: "Guardanapos", qtd: 0, tipo: "Utensílios")
         pratos = Produto(nome: "Pratos", qtd: 0, tipo: "Utensílios")
         copos = Produto(nome: "Copos", qtd: 0, tipo: "Utensílios")
        talheres = Produto(nome: "Talheres", qtd: 0, tipo: "Utensílios")
        toalhaDeMesa = Produto(nome: "Toalha de Mesa", qtd: 0, tipo: "Utensílios")
        
        //ENTRETENIMENTO
        chapeis = Produto(nome: "Chapéis", qtd: 0, tipo: "Entretenimento")
        linguaDeSogra = Produto(nome: "Lingua de Sogra", qtd: 0, tipo: "Entretenimento")
        mascaras = Produto(nome: "Máscaras", qtd: 0, tipo: "Entretenimento")
        
        

        listaSalgados = [miniPastel!, coxinha!, bolinhaDeQueijo!, miniPizza!, pipoca!, croquete!, empadinha!, tortaSalgada!]
        listaDoces = [boloDeAniversario!, brigadeiro!, bixoDePe!, beijinho!, balaDeCoco!, sorvete!, tortaDoce!]
        listaBebidas = [sucos!, refrigerantes!, bebidasAlcoolicas!]
        listaDecoracao = [centroDeMesa!, enfeiteDeParede!, baloes!]
        listaUtensilios = [velasParaBolo!, isqueiro!, facaDeBolo!,guardanapos!, pratos!,copos!,talheres!, toalhaDeMesa!]
        listaEntretenimento = [chapeis!, linguaDeSogra!, mascaras!]
        
         listasGeral = ["listaSalgados":listaSalgados,
                      "listaDoces":listaDoces,
                      "listaBebidas": listaBebidas,
                      "listaDecoracao": listaDecoracao,
                      "listaUtensilios": listaUtensilios,
                      "listaEntretenimento": listaEntretenimento
        ]
        
        
         
         
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(colherTeclado)))
       
    }
    
    @objc func colherTeclado(){
        view.endEditing(false)
    }
}

