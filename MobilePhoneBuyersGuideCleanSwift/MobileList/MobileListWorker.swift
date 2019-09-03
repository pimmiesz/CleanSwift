//
//  MobileListWorker.swift
//  MobilePhoneBuyersGuideCleanSwift
//
//  Created by Patchariya Piyaaromrat on 2/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit


protocol MobileListStoreProtocol {
  func getData(_ completion: @escaping (MobileData) -> Void)
}

class MobileListWorker {
  
  var store: MobileListStoreProtocol
  
  init(store: MobileListStoreProtocol) {
    self.store = store
  }
  
  func getData(_ completion: @escaping (MobileData) -> Void) {
    store.getData { result in
      completion(result)
      
    }
  }
  
}


