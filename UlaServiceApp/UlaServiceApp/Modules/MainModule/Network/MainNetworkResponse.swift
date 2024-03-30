//
//  MainNetworkResponse.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//

import Foundation

struct MainNetworkResponse: Codable {
    let body: MainResponseBody
    let status: Int
}

struct MainResponseBody: Codable {
    let services: [Service]
}

struct Service: Codable {
    let name: String
    let description: String
    let link: URL
    let icon_url: URL
}
