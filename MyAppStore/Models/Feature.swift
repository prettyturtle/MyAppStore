//
//  Feature.swift
//  MyAppStore
//
//  Created by yc on 2021/12/22.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
