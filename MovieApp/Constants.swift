//
//  Constants.swift
//  MovieApp
//
//  Created by Chetan Anand on 22/7/17.
//  Copyright © 2017 ChetanAnand. All rights reserved.
//


import Foundation

/// All Constants used in the App
/// Note :  Using case-less ENUM as Constatnts because of its non-initializable property
enum Constants{
    
    /// General App Configurations
    enum Config {
        static let isDevelopment  = true
        static let apiKey = ""
    }
    
    /// Network Constatnts
    enum Network {
        static var baseUrl : String{
            let devUrl = ""
            let prodUrl = ""
            return Config.isDevelopment ? devUrl : prodUrl
        }
    }
    
    
}
