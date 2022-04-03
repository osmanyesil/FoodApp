//
//  ViewController.swift
//  FoodApp
//
//  Created by osmanyesil on 3/23/22.
//

import UIKit

class HomeVC: UIViewController {

    var foodList = [FoodModel]()
    var filteredData = [FoodModel]()
    var isSearching:Bool = false
    var homePresenterObject:ViewToPresenterHomeProtocol?
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupUI()
        HomeRouter.createModule(ref: self)
        homePresenterObject?.getFoods() // Yemekleri listele
    }
    
    func setupUI(){
        let appearance = UINavigationBarAppearance()
        self.navigationController?.navigationBar.isTranslucent = true
        
        appearance.backgroundColor = UIColor(red: 112/255, green: 13/255, blue: 193/255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: "FoodItemTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodItemTableViewCell")
    }
    
    @IBAction func toBasket(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let basketVC = storyBoard.instantiateViewController(withIdentifier: "BasketVC") as! BasketVC
        self.navigationController?.pushViewController(basketVC, animated: true)
    }
    
    func getCurrentData() -> [FoodModel]{
        return isSearching ? filteredData : foodList
    }
    
}

extension HomeVC : PresenterToViewHomeProtocol {
    func sendDataView(foodList: Array<FoodModel>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
        self.tableView.reloadData()
    }
}

extension HomeVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getCurrentData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodItemTableViewCell", for: indexPath) as! FoodItemTableViewCell
        cell.setupUI(model: getCurrentData()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FoodItemTableViewCell.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.selectedFood = getCurrentData()[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

