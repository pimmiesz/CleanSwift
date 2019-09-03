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
  
}

class MobileListInteractor: MobileListInteractorInterface {
  
  
  var presenter: MobileListPresenterInterface!
  var worker: MobileListWorker?
  var mobileData: [MobileElement] = []
  
  
  
  // MARK: - Business logic
  
  func getData(request: MobileList.GetData.Request) {
    
    worker?.getData({ (result) in
      self.mobileData = result
      let response = MobileList.GetData.Response(mobile: result)
      self.presenter.presentData(response: response)
    })
  }
  
  func setFavorite(request: MobileList.SetFavorite.Request) {
    mobileData[request.indexPath].isfav = !mobileData[request.indexPath].isfav
    let response = MobileList.SetFavorite.Response.init(mobile: mobileData)
    self.presenter.presentFavorite(response: response)
    
  }
  
  
}

