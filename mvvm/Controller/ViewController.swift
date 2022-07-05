
import UIKit

class ViewController: UIViewController {
    var ea : Int = 0
    var ea1 : Int = 0
    let parser = Parser()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let uniNib =  UINib(nibName: "UserViewCell", bundle: nil)
        tableView.register(uniNib, forCellReuseIdentifier: "userCell")
        parser.loadUser()
        parser.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
        
    }

}


extension ViewController:  UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parser.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserViewCell ?? UserViewCell (style : .subtitle,
        reuseIdentifier : "userCell")
        cell.idLabel.text = String( parser.dataArray[indexPath.row].id )
        cell.titleLabel.text = parser.dataArray[indexPath.row].title
        cell.bodyLabel.text = parser.dataArray[indexPath.row].body
        return cell
    }
    
}



