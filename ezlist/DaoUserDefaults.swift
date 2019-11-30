import UIKit

class DaoUserDefaults {

    static func save(lista: [Produto], key:String){
        print("salvando")
        let data = try! PropertyListEncoder().encode(lista)
        
        UserDefaults.standard.set(data, forKey: key)
    }
    
    static func load(key:String) -> [Produto]{
        let data = UserDefaults.standard.data(forKey: key)
        let lista = try! PropertyListDecoder().decode([Produto].self, from: data!)
        
        return lista
        
    }
    
}
