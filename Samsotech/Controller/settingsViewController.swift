//
//  settingsViewController.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 23/12/2020.
//

import UIKit

class settingsViewController: UIViewController {
   
   
    @IBOutlet weak var txt_apikey: UITextField!
    @IBOutlet weak var txt_apihost: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_apihost.text = Settings.SettingModelinstance.APIHost
        txt_apikey.text = Settings.SettingModelinstance.APIKey
      
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_submit(_ sender: UIButton) {
        if(txt_apikey.text != "" && txt_apihost.text != "")
        {
          
            Settings.SettingModelinstance.settings(Host: txt_apihost.text ?? "", Key: txt_apikey.text ?? "")
            
          
            self.navigationController?.popViewController(animated: true)
        }
        else{
            
            showAlert(Message: "Enter missing fileds" , controller: self)
        }
    
    }
    @IBAction func btn_back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
