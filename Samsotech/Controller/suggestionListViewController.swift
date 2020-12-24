//
//  suggestionListViewController.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import UIKit

class suggestionListViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var txt_search: UITextField!
    var searchtext = ""
    @IBOutlet weak var tableview: UITableView!
    lazy var suggestedResult: SuggestViewModel = {
        return SuggestViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        txt_search.text = searchtext
        txt_search.delegate = self
        tableview.bounces = false
        self.tableview.tableFooterView = UIView()
        self.tableview.estimatedRowHeight = 60.0
        self.tableview.rowHeight = UITableView.automaticDimension
       
      
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        bindViewModel()
        setupUI()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txt_search.resignFirstResponder()
        
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        txt_search.resignFirstResponder()
        
        
        if(txt_search.text != "")
        {
            setupUI()
        }
    }
    func bindViewModel() {
        
        self.suggestedResult.changeHandler = {
            [unowned self] change in
            switch change {
            case .error(let message):
                showAlert(Message: Error_code(error_code: message) , controller: self)
                break
            case .loaderEnd:
                self.view.activityStopAnimating()
                break
            case .loaderStart:
                self.view.activityStartAnimating()
                break
            case .updateDataModel:
                self.tableview.delegate = self
                self.tableview.dataSource = self
                self.tableview.reloadData()
                break
            }
        }
    }
    func setupUI() {
        
        self.suggestedResult.getSuggestData(SearchData: txt_search.text ?? "")
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
     return 1
    }
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Suggestions"
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return suggestedResult.SuggestResult?.entities?.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestedList", for: indexPath) as! TableViewCell
        cell.lbl_suggested.text = suggestedResult.SuggestResult?.entities?[indexPath.row].name
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //searchHotels
        
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "searchHotels") as? searchHotelsViewController
        vc?.latitude = "\(suggestedResult.SuggestResult?.entities?[indexPath.row].latitude ?? 0.0)"
        vc?.longitude = "\(suggestedResult.SuggestResult?.entities?[indexPath.row].longitude ?? 0.0)"
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
  
    
    @IBAction func btn_settings(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "settings") as? settingsViewController
    
        self.navigationController?.pushViewController(vc!, animated: true)
       
    }
    
    //suggestedList
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
