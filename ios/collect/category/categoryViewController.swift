




import UIKit

class categoryViewController: UIViewController {
    var keyword:String! = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryDataManager().getUser(self, keyword: keyword)
        // Do any additional setup after loading the view.
    }
    



}
