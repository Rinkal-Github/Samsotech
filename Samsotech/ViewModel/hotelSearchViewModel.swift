//
//  hotelSearchViewModel.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import Foundation
import UIKit

class hotelSearchViewModel:BaseViewModel{
    var changeHandler: ((BaseViewModelChange) -> Void)?
    
    func emit(_ change: BaseViewModelChange) {
        changeHandler?(change)
    }
    
 var hotelSearchResult: hotelSearchBase? {
        didSet {
        
          changeHandler?(.updateDataModel)
        }
    }
  let httpUtility = webservice()
 
  
    func getData(latitude:String,longitude:String) {
      
      
      if CheckInternet.Connection()
    {
         emit(.loaderStart)

        httpUtility.GetData(Api:"\(Endpoints.hotelSearchApi)lat=\(latitude)&lon=\(longitude)",resultType: hotelSearchBase.self){ [weak self](ApiResponse,error)  in
                             self?.emit(.loaderEnd)
         
                            if(error == nil && ApiResponse != nil)
                            {
                               
                                if(ApiResponse?.result == "OK" && ApiResponse?.data != nil)
                                {
                                self?.hotelSearchResult = ApiResponse!
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

