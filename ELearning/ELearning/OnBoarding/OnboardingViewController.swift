//
//  OnboardingViewController.swift
//  ELearning
//
//  Created by Mansi Prajapati on 05/05/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - variables
    private var currentPage = 0
    private let collectionDataModel = OnboradingModel.collectionData
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    //MARK: - IBAction
    @IBAction func nextClick(_ sender: UIButton) {
        if pageControl.currentPage == collectionDataModel.count - 1 {
            goToAuthVC()
        }
        pageControl.currentPage = pageControl.currentPage + 1
        onBoardingCollectionView.scrollToItem(at: IndexPath(item: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func skipClick(_ sender: UIButton) {
            goToAuthVC()
    }

    /// for setting data
    private func setData() {
        onBoardingCollectionView.delegate = self
        onBoardingCollectionView.dataSource = self
        pageControl.numberOfPages = collectionDataModel.count
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    ///for going to authentication viewController
    private func goToAuthVC() {
        if let authVC = UIStoryboard(name: Constant.authenticationStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constant.authenticationIdentifier) as? AuthenticationViewController {
                userHelper.notFirst = true
                self.navigationController?.pushViewController(authVC, animated: true)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension OnboardingViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionDataModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.onboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.imgOnboarding.image = UIImage(named: collectionDataModel[indexPath.row].onBoardingImages)
        cell.title.text = collectionDataModel[indexPath.row].titles
        cell.descriptionTitle.text = collectionDataModel[indexPath.row].descriptions
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = currentPage
    }
}
