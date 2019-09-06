
//
//  mockData.swift
//  MobilePhoneBuyersGuideCleanSwiftTests
//
//  Created by Patchariya Piyaaromrat on 5/9/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//
@testable import MobilePhoneBuyersGuideCleanSwift
import Foundation
import XCTest

struct MobileData{
  static let mobileOne = MobileElement(thumbImageURL: "https://cdn.mos.cms.futurecdn.net/grwJkAGWQp4EPpWA3ys3YC-650-80.jpg",
  brand: "Samsung",
  rating: 4.9,
  id: 1,
  name: "Moto E4 Plus",
  mobileDatumDescription: "First place in our list goes to the excellent Moto E4 Plus. It's a cheap phone that features phenomenal battery life, a fingerprint scanner and a premium feel design, plus it's a lot cheaper than the Moto G5 below. It is a little limited with its power, but it makes up for it by being able to last for a whole two days from a single charge. If price and battery are the most important features for you, the Moto E4 Plus will suit you perfectly.",
  price: 179.99,
  isFav: false)
  
  static let mobileTwo = MobileElement(thumbImageURL: "https://cdn.mos.cms.futurecdn.net/8LWUERoxMAWavvVAAbxuac-650-80.jpg",
                                      brand: "Nokia",
                                      rating: 4.6,
                                      id: 2,
                                      name: "Nokia 6",
                                      mobileDatumDescription: "Nokia is back in the mobile phone game and after a small price drop to the Nokia 6 we've now seen it enter our best cheap phone list. It comes with a Full HD 5.5-inch display, full metal design and a fingerprint scanner for added security. The battery isn't incredible on the Nokia 6, but it's not awful either making this one of our favorite affordable phones on the market right now.",
                                      price: 199.99,
                                      isFav: false)
  static let mobileThree = MobileElement(thumbImageURL: "https://cdn.mos.cms.futurecdn.net/52JJgbgWiGftNHV5UmMDfS-650-80.jpg",
                                       brand: "Motorola",
                                       rating: 4.7,
                                       id: 3,
                                       name: "Moto G4 Plus",
                                       mobileDatumDescription: "The spec for the G4 Plus is much the same as it was on the Moto G4, but it also comes with a fingerprint scanner and an improved camera. The 16MP rear shooter is arguably one of the most impressive phone cameras at the sub-£200 mark. There's no NFC so you won't be able to use Android Pay on the Moto G4 Plus, but a bright display and strong performance is sure to make up for it.",
                                       price: 179,
                                       isFav: false)
  
  static let mobileFour = MobileElement(thumbImageURL: "https://cdn.mos.cms.futurecdn.net/DcUtY6YfhoajHnoKUgGFqn-650-80.jpg",
                                         brand: "Motorola",
                                         rating: 3.8,
                                         id: 4,
                                         name: "Moto G5",
                                         mobileDatumDescription: "Motorola's Moto G5, a former best cheap phone in the world, has slipped a few places thanks to better priced alternatives, plus the introduction of the new G5S. The Moto G5 comes with a metal design, 1080p display and fingerprint scanner. You won't get the fastest chipset on this list or NFC with the Moto G5, but as an all-round product the cheap Motorola phone will serve you well.",
                                         price: 165,
                                         isFav: false)
  static let mobileFive = MobileElement(thumbImageURL: "https://cdn.mos.cms.futurecdn.net/DcUtY6YfhoajHnoKUgGFqn-650-80.jpg",
                                        brand: "Motorola",
                                        rating: 4.3,
                                        id: 5,
                                        name: "Sony Xperia L",
                                        mobileDatumDescription: "Currently the only Sony handset to take a position in our best cheap phone list, the Xperia L1 is a low priced handset that does okay but won't blow your socks off. Other phones in this list are far more impressive as this doesn't have a fingerprint scanner or stunning camera. That said, the price is low and if you really, really like the design of Sony handsets everything here could add up to being your best choice for a cheap phone. We particularly liked the 5.5-inch display - despite its 720p resolution - and the expandable storage too, which allows you to use microSD cards up to 256GB. ",
                                        price: 171.99,
                                        isFav: false)
  
}
