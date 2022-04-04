//
//  ViewController.swift
//  FoodApp
//
//  Created by osmanyesil on 3/23/22.
//

import UIKit

class HomeVC: BaseViewController {

    var foodList = [FoodModel]()
    var filteredData = [FoodModel]()
    var isSearching:Bool = false
    var homePresenterObject:ViewToPresenterHomeProtocol?
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupUI()
        HomeRouter.createModule(ref: self)
        homePresenterObject?.getFoods() // Yemekleri listele
    }
    
    func setupUI(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //layout.itemSize = CGSizeMake(50, 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView?.setCollectionViewLayout(layout, animated: false)
        
    }
    
    private func registerCells(){
        collectionView.register(UINib(nibName: "FoodItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodItemCollectionViewCell")
    }
    
    @IBAction func toBasket(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }
    
    func getCurrentData() -> [FoodModel]{
        return isSearching ? filteredData : foodList
    }
    
}

extension HomeVC : PresenterToViewHomeProtocol {
    func sendDataView(foodList: Array<FoodModel>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText == ""){
            filteredData = foodList
            isSearching = false
        } else{
            isSearching = true
            filteredData = []
            filteredData = foodList.filter{
                $0.name!.lowercased().contains(searchText.lowercased())
            }
        }
        self.collectionView.reloadData()
    }
}

extension HomeVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if getCurrentData().isEmpty && collectionView.backgroundView == nil {
            let noItemLabel = UILabel() //no need to set frame.
            noItemLabel.textAlignment = .center
            noItemLabel.textColor = .lightGray
            noItemLabel.text = "Aranılan yemek bulunamadı.\n Lütfen farklı bir arama yapınız."
            noItemLabel.numberOfLines = 0
            noItemLabel.font = UIFont(name: "Avenir-Medium", size: 18)
            collectionView.backgroundView = noItemLabel
        }
        
        collectionView.backgroundView?.isHidden = !getCurrentData().isEmpty
        return getCurrentData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodItemCollectionViewCell", for: indexPath) as! FoodItemCollectionViewCell
        cell.setupUI(model: getCurrentData()[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.selectedFood = getCurrentData()[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width / 2) - 40
        let height = UIScreen.main.bounds.size.height / 4
        return CGSize(width: width, height: height)
    }
}

