//
//  reviewViewController.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 23/12/2020.
//

import UIKit

class reviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    lazy var hotelReviewsList: hotelReviewsViewModel = {
        return hotelReviewsViewModel()
    }()
    var hotelID = ""
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.bounces = false
        self.tableview.tableFooterView = UIView()
        self.tableview.estimatedRowHeight = 130.0
        self.tableview.rowHeight = UITableView.automaticDimension
       
      
        bindViewModel()
        setupUI()
      
    }
    func bindViewModel() {
        
        self.hotelReviewsList.changeHandler = {
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
        self.hotelReviewsList.getReviewData(hotelID: hotelID)
       
        
    }
    //reviews
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if(hotelReviewsList.reviewsResult?.reviewData?.guestReviewGroups?.guestReviews?.count != 0)
        {
            tableview.backgroundView = nil
        return hotelReviewsList.reviewsResult?.reviewData?.guestReviewGroups?.guestReviews?[0].reviews?.count ?? 0
        }else{
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
            messageLabel.text = "0 Comments"
               messageLabel.numberOfLines = 0;
               messageLabel.textAlignment = .center;
            messageLabel.textColor = UIColor.lightGray
               messageLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
               messageLabel.sizeToFit()
               self.tableview.backgroundView = messageLabel;
        }
        
        return 0
        
        
        
       }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "reviews", for: indexPath) as! TableViewCell
        
        if let data = hotelReviewsList.reviewsResult?.reviewData?.guestReviewGroups?.guestReviews?[0].reviews?[indexPath.row]
        {
        cell.lbl_mainheading.text = "\(data.qualitativeBadgeText ?? "") \(data.formattedRating ?? "")"
        cell.lbl_subheading.text = "\(data.title ?? "")"
        cell.lbl_description.text = "\(data.summary ?? "")"
        cell.lbl_name.text = "\(data.recommendedBy ?? "")"
        }
           return cell
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
