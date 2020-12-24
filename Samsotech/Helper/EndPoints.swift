//
//  Constants.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import Foundation
import UIKit
struct Endpoints {
    
    static let BaseUrl = "https://hotels-com-free.p.rapidapi.com/"
   static let suggestApi = BaseUrl+"suggest/v1.7/json?locale=en_US&query="
    static let hotelSearchApi = BaseUrl+"srle/listing/v1/brands/hotels.com?locale=en_US&currency=AED&pageNumber=1&"
    static let hotelReviewsApi = BaseUrl+"mobile_service/property-content/v1/hotels.com/property/"
   
}



class Settings
{
    public private(set) var APIHost  = "hotels-com-free.p.rapidapi.com"
    public private(set) var APIKey = "639e516594mshfd30f913fa087efp16afecjsna780a06bf99c"
    
    static let SettingModelinstance = Settings()
    
    func settings(Host:String,Key:String)
    {
        
        self.APIHost = Host
        self.APIKey = Key
    }
}

