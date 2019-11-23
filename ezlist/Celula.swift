import UIKit

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
        lista[id!].qtd = nPicker[row]
        print(lista[id!].nome, lista[id!].qtd)
        print("Teste ->", id!)
        DaoUserDefaults.save(lista: lista, key:"lista \(lista[0].tipo)")
        
    }
    @IBOutlet weak var lbl_item: UILabel!
    @IBOutlet weak var field_item: UITextField!
    public var lista: [Produto] = []
    public var id: Int?
    
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
