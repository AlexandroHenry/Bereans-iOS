//
//  verse.swift
//  Bereans
//
//  Created by Seungchul Ha on 2022/12/24.
//

import Foundation

struct Verse: Codable {
    let bookID: BookID
    let bookName: BookName
    let chapter, verse: Int
    let text: String

    enum CodingKeys: String, CodingKey {
        case bookID = "book_id"
        case bookName = "book_name"
        case chapter, verse, text
    }
}

enum BookID: String, Codable {
    case gen = "GEN"
    case exo = "EXO"
    case lev = "LEV"
    case num = "NUM"
    case deu = "DEU"
    case jos = "JOS"
    case jdg = "JDG"
    case rut = "RUT"
    case sa1 = "1SA"
    case sa2 = "2SA"
    case ki1 = "1KI"
    case ki2 = "2KI"
    case ch1 = "1CH"
    case ch2 = "2CH"
    case ezr = "EZR"
    case neh = "NEH"
    case est = "EST"
    case job = "JOB"
    
}

enum BookName: String, Codable {
    case genesis = "Genesis"
    case exodus = "Exodus"
    case leviticus = "Leviticus"
    case numbers = "Numbers"
    case deuteronomy = "Deuteronomy"
    case joshua = "Joshua"
    case judges = "Judges"
    case ruth = "Ruth"
    case samuel1 = "1 Samuel"
    case samuel2 = "2 Samuel"
    case king1 = "1 Kings"
    case king2 = "2 Kings"
    case chronicles1 = "1 Chronicles"
    case chronicles2 = "2 Chronicles"
    case ezra = "Ezra"
    case nehemiah = "Nehemiah"
    case esther = "Esther"
    case job = "Job"
    
}

