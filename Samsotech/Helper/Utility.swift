//
//  Utility.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import Foundation
import Alamofire




class webservice

{
    
   
    func GetData<T:Codable>(Api:String,resultType:T.Type, completionHandler:@escaping(_ result: T?,_ error:String?)-> Void)
     {
    
        
      
        let headers: HTTPHeaders = [
            "x-rapidapi-host":Settings.SettingModelinstance.APIHost ,
            "x-rapidapi-key":Settings.SettingModelinstance.APIKey
        ]

              
        AF.request(Api,method:.get,headers:headers).response(completionHandler: {(responses) in
             switch(responses.result)
             {
             case .success(_):
                if let data = responses.data{
                                           do {
                                               
                                               let Items = try JSONDecoder().decode(T.self, from: data)
                                               
                                               
                                               completionHandler(Items,nil)
                                           }
                                           catch _{
                                            completionHandler(nil,"02")
                                             
                                           }
                                  }
                 break
             case .failure(_):
     completionHandler(nil,"02")

   
                 break
             }
         })
         
   }
   
}
