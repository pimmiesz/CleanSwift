//
//  MobileListViewController.swift
//  MobilePhoneBuyersGuideCleanSwift
//
//  Created by Patchariya Piyaaromrat on 2/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit

protocol MobileListViewControllerInterface: class {
  func displayAllList(viewModel:  MobileList.GetData.ViewModel)
  func addFavorite(cell: UITableViewCell,isFav:Bool)
}

class MobileListViewController: UIViewController, MobileListViewControllerInterface {
 @IBOutlet var mTableView: UITableView!
  @IBOutlet weak var favoriteBtn: UIButton!
  @IBOutlet weak var allBtn: UIButton!

  
  var interactor: MobileListInteractorInterface!
  var router: MobileListRouter!

  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: MobileListViewController) {
    let router = MobileListRouter()
    router.viewController = viewController

    let presenter = MobileListPresenter()
    presenter.viewController = viewController

    let interactor = MobileListInteractor()
    interactor.presenter = presenter
    interactor.worker = MobileListWorker(store: MobileListStore())

    viewController.interactor = interactor
    viewController.router = router
  }

  // MARK: - View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    doSomethingOnLoad()
    mTableView.register(UINib(nibName: "DeatailCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
  }

  // MARK: - Event handling

  func doSomethingOnLoad() {
    // NOTE: Ask the Interactor to do some work
    let request = MobileList.GetData.Request()
    interactor.getData(request: request)
  }

  // MARK: - Display logic
  
  var displayedMobile: [MobileList.GetData.ViewModel.DisplayedMobile] = []
  var displayedAllMobile: [MobileList.GetData.ViewModel.DisplayedMobile] = []
  func displayAllList(viewModel: MobileList.GetData.ViewModel) {
    displayedMobile = viewModel.displayedMobile
    displayedAllMobile = viewModel.displayedMobile
    print(displayedMobile)
    mTableView.reloadData()
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }
  
  func showAlert() {
    let alert = UIAlertController(title: "Sort", message: nil, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Price low to high", style: .default, handler: { (_) in
      self.displayedMobile.sort(by: { (first, second) -> Bool in
        first.price<second.price
      })
      self.displayedMobile.sort(by: { (first, second) -> Bool in
        first.price<second.price
      })
      self.mTableView.reloadData()
    }))
    
    alert.addAction(UIAlertAction(title: "Price high to low", style: .default, handler: { (_) in
      self.displayedMobile.sort(by: { (first, second) -> Bool in
        first.price>second.price
      })
      self.displayedMobile.sort(by: { (first, second) -> Bool in
        first.price>second.price
      })
      
      self.mTableView.reloadData()
    }))
    
    alert.addAction(UIAlertAction(title: "Rating", style: .default, handler: { (_) in
      self.displayedMobile.sort(by: { (first, second) -> Bool in
        first.rating>second.rating
      })
      self.displayedMobile.sort(by: { (first, second) -> Bool in
        first.rating>second.rating
      })
      
      self.mTableView.reloadData()
    }))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
      
    }))
    self.present(alert, animated: true, completion: nil)
  }

  @IBAction func unwindToMobileListViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
  
   @IBAction func tapFav() {
    displayedMobile = displayedMobile.filter { $0.isfav == true }
    mTableView.reloadData()
    allBtn.setTitleColor(UIColor.lightGray, for: .normal)
    favoriteBtn.setTitleColor(UIColor.black, for: .normal)
  }
  
   @IBAction func tapAll() {
    displayedMobile = displayedAllMobile
    mTableView.reloadData()
    allBtn.setTitleColor(UIColor.black, for: .normal)
    favoriteBtn.setTitleColor(UIColor.lightGray, for: .normal)
  }
  
  @IBAction func sortBtn(_ sender: Any) {
    showAlert()
  }
  
}

extension MobileListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.displayedMobile.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as? MobileTableViewCell else {
      return UITableViewCell()
    }
    let bool = displayedMobile[indexPath.row].isfav
    cell.vc = self
    cell.nameLabel.text = displayedMobile[indexPath.row].name
    cell.descriptionLabel.text = displayedMobile[indexPath.row].mobileDatumDescription
    cell.priceLabel.text = displayedMobile[indexPath.row].price
    cell.ratingLabel.text = displayedMobile[indexPath.row].rating
    cell.img.loadImageUrl(displayedMobile[indexPath.row].thumbImageURL)
//    cell.starBtn.isHidden = isSelected
    cell.setImageButton(isfav: bool)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "showDetail", sender: displayedMobile[indexPath.row])
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if (editingStyle == .delete) {
//      let id = favInfo[indexPath.row].id
//      favInfo.remove(at: indexPath.row)
//      info = favInfo
//      var index = 0
//      while(index < allInfo.count) {
//        if id == allInfo[index].id {
//          allInfo[index].isfav = false
//          let index = idList.firstIndex(of: self.allInfo[index].id)
//          idList.remove(at: index ?? 0)
//        }
//        index+=1
//      }
      
      mTableView.reloadData()
    }
  }
  
  func addFavorite(cell: UITableViewCell,isFav:Bool) {
    let favCell = mTableView.indexPath(for: cell)
    let index = favCell?.row ?? 0 as Int
    let request = MobileList.SetFavorite.Request(indexPath: index)
    interactor.setFavorite(request: request)
    mTableView.reloadData()
  }
  
}

extension UIImageView {
  func loadImageUrl(_ urlString: String) {
    if let url = URL(string: urlString) {
      af_setImage(withURL: url)
    }
  }
}
