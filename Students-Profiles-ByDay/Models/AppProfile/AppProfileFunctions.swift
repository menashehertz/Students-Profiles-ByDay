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
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Coloors level 1"))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Letters level 3"))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Writing level 2"))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for math level 2"))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Colors level 1"))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Letters level 2"))

            }
            DispatchQueue.main.async {
                print(AppProfileData.listOfProfiles[1].title)
                completion(AppProfileData.listOfProfiles)
            }
        }
    }
}
