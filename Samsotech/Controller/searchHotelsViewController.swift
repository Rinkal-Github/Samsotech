//
//  searchHotelsViewController.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import UIKit
import SDWebImage

class searchHotelsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
 var latitude = ""
    var longitude = ""
    @IBOutlet weak var tableview: UITableView!
    lazy var hotelList: hotelSearchViewModel = {
        return hotelSearchViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.bounces = false
        self.tableview.tableFooterView = UIView()
        self.tableview.estimatedRowHeight = 180.0
        self.tableview.rowHeight = UITableView.automaticDimension
       
        
        bindViewModel()
        setupUI()
        // Do any additional setup after loading the view.
    }
    func bindViewModel() {
        
        self.hotelList.changeHandler = {
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
     
        self.hotelList.getData(latitude: latitude, longitude: longitude)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return hotelList.hotelSearchResult?.data?.body?.searchResults?.results?.count ?? 0
          
       }
    
    @IBAction func btn_back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "hotels", for: indexPath) as! TableViewCell
      if let data = hotelList.hotelSearchResult?.data?.body?.searchResults?.results?[indexPath.row]
      {
        cell.lbl_hotelName.text = data.name
        cell.lbl_hotelAddress.text = data.address?.streetAddress
        cell.lbl_hotelRatings.text = "\(data.starRating ?? 0)"
        cell.lbl_price.text =  data.ratePlan?.price?.current
        if(data.ratePlan?.price?.old != "")
        {
            cell.lbl_oldPrice.attributedText = "\(data.ratePlan?.price?.old ?? "")".strikeThrough()
        }
       
        cell.lbl_customerRatings.text =  data.guestReviews?.badgeText
        cell.img_hotelimage.sd_setImage(with: URL(string : data.thumbnailUrl?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""), placeholderImage:nil)
        }
           return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //searchHotels
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "hotelReviews") as? reviewViewController
        vc?.hotelID = "\(hotelList.hotelSearchResult?.data?.body?.searchResults?.results?[indexPath.row].id ?? 0)"
        self.navigationController?.pushViewController(vc!, animated: true)
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
