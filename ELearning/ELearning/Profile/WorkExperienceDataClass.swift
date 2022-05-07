//
//  WorkExperienceDataClass.swift
//  ELearning
//
//  Created by Mansi Prajapati on 05/05/22.
//

import Foundation

class WorkExperienceDataClass {
    
    //MARK: - Variables
    var year: String
    var description: String
    
    //MARK: - Init
    init(year: String, description: String) {
        self.year = year
        self.description = description
    }
    
    /// data for work details
    static func getWorkDetails() -> [WorkExperienceDataClass] {
        return [WorkExperienceDataClass(year: "2011- 2013", description: "Mink State Regional Lycuem Physics and maths"),
                WorkExperienceDataClass(year: "2013- 2018", description: "Belarusain State Uiniversity Magistracy of physics"),
                WorkExperienceDataClass(year: "2018- 2020", description: "Belarusain State Uiniversity Magistracy of physics"),
                WorkExperienceDataClass(year: "2020- 2021", description: "Mink State Regional Lycuem Physics and maths")]
    }
}
