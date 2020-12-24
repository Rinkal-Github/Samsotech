//
//  ErrorCodes.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//


import Foundation
import UIKit

func Error_code(error_code: String) -> String {
    var str:String!
    switch (error_code) {
    case "01":
        str = "Network connection not available, kindly check your connection and try again."
    case "02":
        str = "There seems to be an issue with the server connection. Please try again"
    case "03":
        str = "There seems to be an issue with the response from the server. Please try again"
    case "04":
        str = "No data found"
    
    
    default:
        str = "An error has occurred. Please Try Again"
    }
    return str
}


