//
//  ListadoViewController.swift
//  CursoiOS-Proyecto1
//
//  Created by Adrian Iraizos Mendoza on 27/1/22.
//

import UIKit

class ListadoViewController: UIViewController, ListadoViewContract, UITableViewDelegate, UITableViewDataSource {

    //MARK: Dependencias
    var presenter: ListadoPresenterContract?

    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.viewDidLoad()
    }
    
    //MARK: Métodos
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewModel = presenter?.cellViewModel(at: indexPath), let cell = tableView.dequeueReusableCell(withIdentifier: "listadoCell", for: indexPath) as? ListadoViewCell else {
            fatalError()
        }
      
        cell.configure(with: viewModel)
        return cell
        
    }
}


extension ListadoViewController {
    static func createFromStoryboard() -> ListadoViewController {
        return UIStoryboard(name: "ListadoViewController", bundle: .main).instantiateViewController(withIdentifier: "ListadoViewController") as! ListadoViewController
    }
}

extension ListadoViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
}
