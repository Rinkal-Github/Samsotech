//
//  SuggestViewModel.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import Foundation
import UIKit

class SuggestViewModel:BaseViewModel{
    var changeHandler: ((BaseViewModelChange) -> Void)?
    
    func emit(_ change: BaseViewModelChange) {
        changeHandler?(change)
    }
    
 var SuggestResult: Suggestions? {
        didSet {
        
          changeHandler?(.updateDataModel)
        }
    }
  let httpUtility = webservice()
 
  
    func getSuggestData(SearchData:String) {
      
      
      if CheckInternet.Connection()
    {
         emit(.loaderStart)
        let searchString = SearchData.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        httpUtility.GetData(Api:"\(Endpoints.suggestApi)\(searchString ?? "")",resultType: SuggestionBase.self){ [weak self](ApiResponse,error)  in
                             self?.emit(.loaderEnd)
                            if(error == nil && ApiResponse != nil)
                            {
                                
                               let foundItems = ApiResponse?.suggestions?.filter { $0.group == "HOTEL_GROUP"}
                               
                                if(foundItems != nil && foundItems?.count != 0 )
                            {
                                self?.SuggestResult = foundItems?[0]
                            }
                                else
                                {
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

