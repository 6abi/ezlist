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
