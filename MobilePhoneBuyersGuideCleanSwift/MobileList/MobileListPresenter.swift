//
//  MobileListPresenter.swift
//  MobilePhoneBuyersGuideCleanSwift
//
//  Created by Patchariya Piyaaromrat on 2/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit


protocol MobileListPresenterInterface {
  func presentData(response: MobileList.GetData.Response)
  func presentFavorite(response: MobileList.SetFavorite.Response)
  func presentSortData(response: MobileList.SortData.Response)
}

class MobileListPresenter: MobileListPresenterInterface {
  
  
  
  
  weak var viewController: MobileListViewControllerInterface!

  // MARK: - Presentation logic

  func presentData(response: MobileList.GetData.Response) {
    var displayedMobiles: [MobileList.GetData.ViewModel.DisplayedMobile] = []
    for mb in response.mobile{
      let mobileData = MobileList.GetData.ViewModel.DisplayedMobile(thumbImageURL: mb.thumbImageURL, brand: mb.brand, rating: "Rating: \( mb.rating)", id: mb.id, name: mb.name, mobileDatumDescription: mb.mobileDatumDescription, price: "Price: $\(mb.price)", isFav: mb.isFav)
      displayedMobiles.append(mobileData)
    }
    
    let viewModel = MobileList.GetData.ViewModel(displayedMobile: displayedMobiles)
    viewController.displayAllList(viewModel: viewModel)
  }
  
  func presentFavorite(response: MobileList.SetFavorite.Response) {
    var displayedMobiles: [MobileList.GetData.ViewModel.DisplayedMobile] = []
    for mb in response.mobile{
      let mobileData = MobileList.GetData.ViewModel.DisplayedMobile(thumbImageURL: mb.thumbImageURL, brand: mb.brand, rating: "Rating: \( mb.rating)", id: mb.id, name: mb.name, mobileDatumDescription: mb.mobileDatumDescription, price: "Price: $\(mb.price)", isFav: mb.isFav)
      displayedMobiles.append(mobileData)
    }

    let viewModel = MobileList.GetData.ViewModel(displayedMobile: displayedMobiles)
    viewController.displayAllList(viewModel: viewModel)
  }
  
  func presentSortData(response: MobileList.SortData.Response) {
    var displayedMobiles: [MobileList.GetData.ViewModel.DisplayedMobile] = []
    for mb in response.mobile{
      let mobileData = MobileList.GetData.ViewModel.DisplayedMobile(thumbImageURL: mb.thumbImageURL, brand: mb.brand, rating: "Rating: \( mb.rating)", id: mb.id, name: mb.name, mobileDatumDescription: mb.mobileDatumDescription, price: "Price: $\(mb.price)", isFav: mb.isFav)
      displayedMobiles.append(mobileData)
    }
    
    let viewModel = MobileList.GetData.ViewModel(displayedMobile: displayedMobiles)
    viewController.displayAllList(viewModel: viewModel)
  }
}
