//
//  QueryFactViewController.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 1/2/22.
//

import UIKit

class QueryFactViewController: UIViewController, QueryFactViewContract, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: QueryFactPresenterContract?
    
    func reloadData() {
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter?.viewDidLoad()
        
        
    }
    
}


extension QueryFactViewController {
    static func createFromStoryboard() -> QueryFactViewController {
        return UIStoryboard(name: "QueryFactViewController", bundle: .main).instantiateViewController(withIdentifier: "QueryFactViewController") as! QueryFactViewController
    }
}


extension QueryFactViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewModel = presenter?.cellViewModel(at: indexPath), let cell = tableView.dequeueReusableCell(withIdentifier: "queryFactCell", for: indexPath) as? QueryFactViewCell else {
            fatalError()
        }
        
        cell.configure(with: viewModel)
        return cell
    }
}
