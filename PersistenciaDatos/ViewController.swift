import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var resultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getAction(_ sender: Any) {
        var cadena: String = "Sin Datos Guardados"
        if let usuario: String = UserDefaults.standard.string(forKey: "user") {
            cadena = "Usuario: \(usuario) "
        }
        if let contra: String = UserDefaults.standard.string(forKey: "contra") {
            cadena += "Password: \(contra) "
        }
        resultado.text = cadena
    }
    
    @IBAction func putAction(_ sender: Any) {
        if usuario.text == "" || pass.text == "" {
            alerta("Error", "Favor de llenar los datos")
        } else {
            UserDefaults.standard.set(usuario.text, forKey: "user")
            UserDefaults.standard.set(pass.text, forKey: "contra")
            resultado.text = ""
            alerta("Exito", "Datos Guardados Correctamente")
        }
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        if let _ = UserDefaults.standard.string(forKey: "user") {
            UserDefaults.standard.removeObject(forKey: "user")
        }
        if let _ = UserDefaults.standard.string(forKey: "contra") {
            UserDefaults.standard.removeObject(forKey: "contra")
        }
        alerta("Exito", "Datos Eliminados Correctamente")
    }
    
    private func alerta(_ titulo: String, _ mensaje: String) -> Void {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

