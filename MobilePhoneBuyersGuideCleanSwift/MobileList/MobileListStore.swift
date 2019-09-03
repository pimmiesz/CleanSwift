//
//  MobileListStore.swift
//  MobilePhoneBuyersGuideCleanSwift
//
//  Created by Patchariya Piyaaromrat on 2/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

/*

 The MobileListStore class implements the MobileListStoreProtocol.

 The source for the data could be a database, cache, or a web service.

 You may remove these comments from the file.

 */

class MobileListStore: MobileListStoreProtocol {
  let url = "https://scb-test-mobile.herokuapp.com/api/mobiles/"
  func getData(_ completion: @escaping (MobileData) -> Void) {
    AF.request(URL(string: url)!, method: .get).responseJSON { response in
      switch response.result {
      case .success:
        do {
          print("success feed")
          let decoder = JSONDecoder()
          let result = try decoder.decode(MobileData.self, from: response.data!)
          completion(result)
        } catch let error {
          print("error case success")
          print(error)
        }
      case let .failure(error):
        print("error case failure")
        print(error)
      }
    }
    // Simulates an asynchronous background thread that calls back on the main thread after 2 seconds
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//      completion(Result.success(MobileData()))
//    }
  }
}
