//
//  MobileListModels.swift
//  MobilePhoneBuyersGuideCleanSwift
//
//  Created by Patchariya Piyaaromrat on 2/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit

struct MobileList {
  /// This structure represents a use case
  enum  sortData {
    case lowToHigh
    case highToLow
    case rating
  }
  
  struct SetFavorite {
    /// Data struct sent to Interactor
    struct Request {
      var indexPath: Int
    }
    /// Data struct sent to Presenter
    struct Response {
       var mobile: MobileData
    }
    /// Data struct sent to ViewController
    struct ViewModel {
      struct DisplayedMobile
      {
        let thumbImageURL: String
        let brand: String
        let rating: String
        let id: Int
        let name, mobileDatumDescription: String
        let price: String
        var isfav:Bool = false
      }
      var displayedMobile: [DisplayedMobile]
      
    }
  }
  
  struct SortData {
    /// Data struct sent to Interactor
    struct Request {
      var sort: sortData
    }
    /// Data struct sent to Presenter
    struct Response {
      var mobile: MobileData
    }
    /// Data struct sent to ViewController
    struct ViewModel {
      struct DisplayedMobile
      {
        let thumbImageURL: String
        let brand: String
        let rating: String
        let id: Int
        let name, mobileDatumDescription: String
        let price: String
        var isFav:Bool = false
      }
      var displayedMobile: [DisplayedMobile]
      
    }
  }
  
  struct GetData {
    /// Data struct sent to Interactor
    struct Request {}
    /// Data struct sent to Presenter
    struct Response {
       var mobile: MobileData
      
    }
    /// Data struct sent to ViewController
    struct ViewModel {
      struct DisplayedMobile
      {
        let thumbImageURL: String
        let brand: String
        let rating: String
        let id: Int
        let name, mobileDatumDescription: String
        let price: String
        var isFav:Bool = false
      }
      var displayedMobile: [DisplayedMobile]
      
    }
  }
}


