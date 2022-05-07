//
//  ProfileViewController.swift
//  ELearning
//
//  Created by Mansi Prajapati on 04/05/22.
//

import UIKit
import Rswift
import UserNotifications
var badgeCount = 0

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate{
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var seeMore: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var btnMessage: CustomProfileButton!
    
    //MARK: - variables
    var backButton = UIBarButtonItem()
    var workData = WorkExperienceDataClass.getWorkDetails()
    let center = UNUserNotificationCenter.current()
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        setData()
        expandTextView()
    }
    
    @IBAction func userData(_ sender: Any) {
    }
    @IBAction func followClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: Constant.authenticationStoryboard, bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: Constant.authenticationIdentifier)
        userHelper.isLoggedIn = false
        userHelper.notFirst = true
        self.navigationController?.pushViewController(loginNavController, animated: true)
    }
    
    @IBAction func messageClick(_ sender: Any) {
        let meetingInviteCategory =
        UNNotificationCategory(identifier: Constant.messageCategory,
                               actions: [Actions.reply.actions, Actions.decline.actions],
                               intentIdentifiers: [],
                               hiddenPreviewsBodyPlaceholder: "",
                               options: .customDismissAction)
        btnMessage.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.btnMessage.isUserInteractionEnabled = true
        }
        let content = UNMutableNotificationContent()
        content.title = R.string.localizable.localNotificationTitle()
        content.body =  R.string.localizable.localNotificationBody()
        content.sound = .default
        badgeCount += 1
        content.badge = badgeCount as NSNumber
        content.userInfo = ["value": "Data with local notification"]
        content.categoryIdentifier = Constant.messageCategory
        center.setNotificationCategories([meetingInviteCategory])
        center.getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                if(settings.authorizationStatus == .authorized) {
                    let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date().addingTimeInterval(10))
                    let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
                    let url = Bundle.main.url(forResource: "learn1", withExtension: ".png")
                    do {
                        let attachment = try? UNNotificationAttachment(identifier: Constant.reminderIdentifier, url: url!, options: nil)
                        content.attachments = [attachment!]
                    }
                    
                    let uuid = UUID().uuidString
                    addNotification(content: content, trigger: trigger, indentifier:  uuid)
                }
                else {
                    let ac = UIAlertController(title: R.string.localizable.settingAlertTiltle(), message: R.string.localizable.settingAlertMessage(), preferredStyle: .alert)
                    let goToSettings = UIAlertAction(title: R.string.localizable.settingsAction(), style: .default)
                    { (_) in
                        guard let setttingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
                        
                        if(UIApplication.shared.canOpenURL(setttingsURL))
                        {
                            UIApplication.shared.open(setttingsURL) { (_) in}
                        }
                    }
                    ac.addAction(goToSettings)
                    ac.addAction(UIAlertAction(title: R.string.localizable.cancelAction(), style: .default, handler: { (_) in}))
                    self.present(ac, animated: true)
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myLabel.numberOfLines = 3
    }
    
    ///for expanding textview
    private func expandTextView() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.titleView = setTitle(title: R.string.localizable.title(), subtitle: R.string.localizable.subTitle())
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "BackButton")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(BackButtonClick))
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
    @objc func BackButtonClick() {
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
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

extension ProfileViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner ,.badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case Constant.acceptAction :
            print("Saved")
        case Constant.declineAction :
            print ("Declined")
        case Constant.replyAction :
            if let textResponse = response as? UNTextInputNotificationResponse {
                self.showAlert(message: textResponse.userText)
            }
        case Constant.openAction :
            print("open")
        default:
            print("Other Action")
        }
        completionHandler()
    }
}
