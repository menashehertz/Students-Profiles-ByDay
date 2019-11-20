//
//  AppProfileFunctions.swift
//  Students-Profiles-ByDay
//
//  Created by Steven Hertz on 11/19/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import Foundation

class AppProfileFunctions {
    static func readAppProfiles(completion: @escaping ([AppProfile])->() ) -> Void {
        DispatchQueue.global(qos: .background).async {
            if AppProfileData.listOfProfiles.count == 0 {
                AppProfileData.listOfProfiles.append(AppProfile(title: "Hello"))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Second"))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Third"))
            }
            DispatchQueue.main.async {
                print(AppProfileData.listOfProfiles[1].title)
                completion(AppProfileData.listOfProfiles)
            }
        }
    }
}
