//
//  ProfileViewController.swift
//  ELearning
//
//  Created by Mansi Prajapati on 04/05/22.
//

import UIKit
import Rswift

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var seeMore: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    
    //MARK: - variables
    var backButton = UIBarButtonItem()
    var workData = WorkExperienceDataClass.getWorkDetails()
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        expandTextView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myLabel.numberOfLines = 3
    }
    
    ///for expanding textview
    private func expandTextView() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.titleView = setTitle(title: R.string.localizable.title(), subtitle: R.string.localizable.subTitle())
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "BackButton")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(OnPopClicked))
        let attributedString = NSMutableAttributedString(string: R.string.localizable.about())
        myLabel.attributedText = attributedString
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapSeeMore))
        seeMore.isUserInteractionEnabled = true
        seeMore.addGestureRecognizer(tap)
        tap.delegate = self
    }
    
    ///expand and collapse label
    @objc func tapSeeMore() {
        if myLabel.numberOfLines == 0 {
            myLabel.numberOfLines = 3
            seeMore.text = R.string.localizable.seeMore()
        } else {
            myLabel.numberOfLines = 0
            seeMore.text = R.string.localizable.seeLess()
        }
    }
    
    /// for setting data
    fileprivate func setData() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Objective-C Function
    @objc func OnPopClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    /// for setting navigation item title
    func setTitle(title:String, subtitle:String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -2, width: 0, height: 0))
        titleLabel.text = title
        titleLabel.textColor = UIColor.textColorDark
        titleLabel.font = R.font.jostMedium(size: 16)
        titleLabel.sizeToFit()
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: 22, width: 0, height: 0))
        subTitle.textColor = UIColor.black
        subTitle.text = subtitle
        subTitle.font = R.font.jostRegular(size: 12)
        subTitle.textColor = UIColor.subTitleColor
        subTitle.sizeToFit()
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subTitle.frame.size.width), height: 30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subTitle)
        
        let widthDiff = subTitle.frame.size.width - titleLabel.frame.size.width
        
        if widthDiff < 0 {
            let newX = widthDiff / 2
            subTitle.frame.origin.x = abs(newX)
        } else {
            let newX = widthDiff / 2
            titleLabel.frame.origin.x = newX
        }
        return titleView
    }
}

//MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.workExperienceTableCell.identifier) as? WorkExperienceTableViewCell else {return UITableViewCell()}
        if(workData.count > .zero) {
            cell.lblYear.text = workData[indexPath.row].year
            cell.lblDescription.text = workData[indexPath.row].description
        }
        return cell
    }
}

