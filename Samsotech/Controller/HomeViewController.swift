//
//  HomeViewController.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import UIKit

class HomeViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var txt_search: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_search.delegate = self
       
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txt_search.resignFirstResponder()
        
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        txt_search.resignFirstResponder()
        
        
        if(txt_search.text != "")
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "suggestedList") as? suggestionListViewController
            vc?.searchtext = txt_search.text!
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
