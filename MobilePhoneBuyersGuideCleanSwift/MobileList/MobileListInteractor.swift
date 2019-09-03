//
//  MobileListInteractor.swift
//  MobilePhoneBuyersGuideCleanSwift
//
//  Created by Patchariya Piyaaromrat on 2/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit

protocol MobileListInteractorInterface {
  func getData(request: MobileList.GetData.Request)
  func setFavorite(request: MobileList.SetFavorite.Request)
  func sortData(request: MobileList.SortData.Request)
  var mobileData:MobileData { get set }
  
}

class MobileListInteractor: MobileListInteractorInterface {
  
  
  
  var presenter: MobileListPresenterInterface!
  var worker: MobileListWorker?
  var mobileData: [MobileElement] = []
  
  enum sort {
    case lowToHigh
    case highToLow
    case rating
  }
  
  
  // MARK: - Business logic
  
  func getData(request: MobileList.GetData.Request) {
    
    worker?.getData({ (result) in
      self.mobileData = result
      let response = MobileList.GetData.Response(mobile: result)
      self.presenter.presentData(response: response)
    })
  }
  
  func setFavorite(request: MobileList.SetFavorite.Request) {
    mobileData[request.indexPath].isFav = !mobileData[request.indexPath].isFav
    let response = MobileList.SetFavorite.Response.init(mobile: mobileData)
    self.presenter.presentFavorite(response: response)
    
  }
  
  func sortData(request: MobileList.SortData.Request) {
    switch request.sort {
    case .lowToHigh:
      self.mobileData.sort(by: { (first, second) -> Bool in
        first.price<second.price
      })
    case .highToLow:
      self.mobileData.sort(by: { (first, second) -> Bool in
        first.price>second.price
      })
     
    case .rating:
      self.mobileData.sort(by: { (first, second) -> Bool in
        first.rating>second.rating
      })
      
    }
    let repponse = MobileList.SortData.Response.init(mobile: mobileData)
    self.presenter.presentSortData(response: repponse)
  }
  
  
  
}

