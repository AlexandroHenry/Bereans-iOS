//
//  BookInfo.swift
//  Bereans
//
//  Created by Seungchul Ha on 2022/12/30.
//

import Foundation

struct BookInfo: Codable, Hashable {
    let chapter: Int
    let english, korean, japanese, french: String
    let spanish, chinese, german, russian: String
    let greek, hindi, portuguese: String
}
