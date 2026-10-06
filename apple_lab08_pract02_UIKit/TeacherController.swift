import UIKit

struct Docente {
    let nombre: String
    let curso: String
    let email: String
}

class TeacherController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    
    private let docentes: [Docente] = [
        Docente(nombre: "Bruno Pareja", curso: "Móviles Avanzados", email: "bpareja@tecsup.edu.pe"),
        Docente(nombre: "Carlos Mendoza", curso: "Desarrollo Web", email: "cmendoza@tecsup.edu.pe"),
        Docente(nombre: "Ana Torres", curso: "Base de Datos", email: "atorres@tecsup.edu.pe"),
        Docente(nombre: "Juan Pérez", curso: "Sistemas Operativos", email: "jperez@tecsup.edu.pe")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Docentes"
        view.backgroundColor = .systemBackground
        
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
    }

    // MARK: - Métodos de la Lista (Tabla)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docentes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let docente = docentes[indexPath.row]
        cell.textLabel?.text = docente.nombre
        cell.detailTextLabel?.text = "\(docente.curso) - \(docente.email)"
        return cell
    }
}
