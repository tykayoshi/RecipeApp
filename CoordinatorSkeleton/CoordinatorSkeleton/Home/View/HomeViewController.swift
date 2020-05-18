//
//  HomeViewController.swift
//  CoordinatorSkeleton
//
//  Created by Ilkay Hamit on 16/09/2019.
//  Copyright © 2019 Ilkay Hamit. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol!
    var recipes: [Recipe] = [Recipe(name:"Pumpkin Pie", timeToCook: "2hrs", difficulty: "hard", image: "pumpkin", people: 2), Recipe(name:"Potato Smiles", timeToCook: "1hrs", difficulty: "easy", image: "smilies", people: 3), Recipe(name:"Buffalo Wings", timeToCook: "1.5hrs", difficulty: "medium", image: "wings", people: 4)]

    @IBOutlet weak var buttonMeal: UIButton!
    @IBOutlet weak var buttonSalad: UIButton!
    @IBOutlet weak var buttonDrink: UIButton!
    @IBOutlet weak var buttonDessert: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellScale: CGFloat = 0.6
    var once = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = 210
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 300, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
        
//        buttonMeal.alignImageAndTitleVertically()
//        buttonDrink.alignImageAndTitleVertically()
//        buttonSalad.alignImageAndTitleVertically()
//        buttonDessert.alignImageAndTitleVertically()
        
        let CarouselNib = UINib(nibName: String(describing: CarouselCollectionViewCell.self), bundle: nil)
        collectionView?.register(CarouselNib, forCellWithReuseIdentifier: String(describing: CarouselCollectionViewCell.self))
        
        print("cellHeight \(cellHeight)")
    }
    
    
    @IBAction func BrowseAllRecipesBtn(_ sender: Any) {
        presenter.BrowseAllRecipesBtnPressed()
    }
    
}

extension HomeViewController: HomeViewProtocol {
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as! CarouselCollectionViewCell
    
        cell.recipeNameLbl.text = recipes[indexPath.item].name
        cell.recipeTypeLbl.text = "Meal"
        cell.timeLabel.text = recipes[indexPath.item].timeToCook
        cell.recipeImage.image = UIImage(named: recipes[indexPath.item].image)
        cell.personLabel.text = String(recipes[indexPath.item].people)
        cell.difficultyLabel.text = recipes[indexPath.item].difficulty
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if !once {
//            let indexToScrollTo = IndexPath(item: 1, section: 0)
//            self.collectionView.scrollToItem(at: indexToScrollTo, at: .left, animated: false)
//            once = true
//        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let cellWidthIncludingSpace = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpace
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpace - scrollView.contentInset.left, y: scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset
    }

}

extension HomeViewController {
    static func makeFromStoryboard() -> HomeViewController {
        let viewController = StoryboardScene.Home.homeViewController.instantiate()
        return viewController
    }
}
