//
//  BaseViewModel.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import Foundation
protocol BaseViewModel {
    
    var changeHandler: ((BaseViewModelChange) -> Void)? {get set}
    func emit(_ change:BaseViewModelChange)
}

enum BaseViewModelChange {
    case loaderStart
    case loaderEnd
    case updateDataModel
    case error(message: String)
}

