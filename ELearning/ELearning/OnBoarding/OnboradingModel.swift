//
//  OnboradingModel.swift
//  ELearning
//
//  Created by Mansi Prajapati on 05/05/22.
//

import Foundation

class OnboradingModel {
    
    //MARK: - Variables
    var titles: String
    var descriptions: String
    var onBoardingImages: String
    
    //MARK: - init
    init(title: String,description: String,onBoardingImage: String) {
        titles = title
        descriptions = description
        onBoardingImages = onBoardingImage
    }
    
    /// data for onboarding
    static let collectionData = [OnboradingModel(title: "Online Learning Platform", description: "Videos,Tests,Communicaion,Online session ", onBoardingImage: "onboard"),OnboradingModel(title: "Learn on Your Schedule", description: "Anywhere,anytime,Start learning today", onBoardingImage: "onboard"),OnboradingModel(title: "Ready to find a course", description: "Discover the online learning", onBoardingImage: "onboard"),OnboradingModel(title: "Ready to find a course", description: "Discover the online learning", onBoardingImage: "onboard")]
}
