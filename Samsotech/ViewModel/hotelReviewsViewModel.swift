//
//  hotelReviewsViewModel.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 23/12/2020.
//

import Foundation
import UIKit

class hotelReviewsViewModel:BaseViewModel{
    var changeHandler: ((BaseViewModelChange) -> Void)?
    
    func emit(_ change: BaseViewModelChange) {
        changeHandler?(change)
    }
    
    var reviewsResult: reviewBase? {
        didSet {
            
            changeHandler?(.updateDataModel)
        }
    }
    let httpUtility = webservice()
    
    
    func getReviewData(hotelID:String) {
        
        
        if CheckInternet.Connection()
        {
            emit(.loaderStart)
            
            httpUtility.GetData(Api:"\(Endpoints.hotelReviewsApi)\(hotelID)/reviews?loc=en_US",resultType: reviewBase.self){ [weak self](ApiResponse,error)  in
                self?.emit(.loaderEnd)
                if(error == nil && ApiResponse != nil)
                {
                    if(ApiResponse?.result == "OK" && ApiResponse?.reviewData != nil)
                    {
                        self?.reviewsResult = ApiResponse!
                        
                    }
                    else{
                        self?.emit(.error(message: "04"))
                    }
                    
                }
                else
                {
                    
                    self?.emit(.loaderEnd)
                    self?.emit(.error(message: "03"))
                    
                    
                }
            }
            
        }
        else
        {
            self.emit(.loaderEnd)
            self.emit(.error(message: "01"))
        }
        
    }
    
    
}


