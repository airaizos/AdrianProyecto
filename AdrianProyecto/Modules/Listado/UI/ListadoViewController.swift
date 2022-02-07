//
//  ListadoViewController.swift
//  CursoiOS-Proyecto1
//
//  Created by Adrian Iraizos Mendoza on 27/1/22.
//

import UIKit

class ListadoViewController: UIViewController, ListadoViewContract, UITableViewDelegate, UITableViewDataSource {

    var presenter: ListadoPresenterContract?

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var randomAnimalsButton: UIButton! {
        didSet {
            randomAnimalsButton.setTitle(NSLocalizedString("listado_random_animals_button",comment: ""), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.viewDidLoad()
        
        tableView.backgroundColor = UIColor(named: "backgroundPrimary")
        view.backgroundColor = UIColor(named: "backgroundPrimary")
    }
    
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
        cell.backgroundColor = UIColor(named: "backgroundPrimary")
        return cell
    }
    @IBAction func getMore(_ sender: UIButton) {
        presenter?.didPressGetMoreButton()
        
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
