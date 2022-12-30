//
//  verse.swift
//  Bereans
//
//  Created by Seungchul Ha on 2022/12/24.
//

import Foundation

struct APIChapterResult: Codable {
    let reference: String
    let verses: [Verse]
    let text, translationID, translationName: String

    enum CodingKeys: String, CodingKey {
        case reference, verses, text
        case translationID = "translation_id"
        case translationName = "translation_name"
    }
}

// MARK: - Verse
struct Verse: Codable, Hashable {
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
    case psa = "PSA"
    case pro = "PRO"
    case ecc = "ECC"
    case sng = "SNG"
    case isa = "ISA"
    case jer = "JER"
    case lam = "LAM"
    case ezk = "EZK"
    case dan = "DAN"
    case hos = "HOS"
    case jol = "JOL"
    case amo = "AMO"
    case oba = "OBA"
    case jon = "JON"
    case mic = "MIC"
    case nam = "NAM"
    case hab = "HAB"
    case zep = "ZEP"
    case hag = "HAG"
    case zec = "ZEC"
    case mal = "MAL"
    case mat = "MAT"
    case mrk = "MRK"
    case luk = "LUK"
    case jhn = "JHN"
    case act = "ACT"
    case rom = "ROM"
    case co1 = "1CO"
    case co2 = "2CO"
    case gal = "GAL"
    case eph = "EPH"
    case php = "PHP"
    case col = "COL"
    case th1 = "1TH"
    case th2 = "2TH"
    case ti1 = "1TI"
    case ti2 = "2TI"
    case tit = "TIT"
    case phi = "PHI" // Philemon
    case heb = "HEB"
    case jas = "JAS"
    case pe1 = "1PE"
    case pe2 = "2PE"
    case jn1 = "1JN"
    case jn2 = "2JN"
    case jn3 = "3JN"
    case jud = "JUD"
    case rev = "REV"
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
    case psalms = "Psalms"
    case proverbs = "Proverbs"
    case ecclesiastes = "Ecclesiastes"
    case songofsongs = "Song of Songs"
    case isaiah = "Isaiah"
    case jeremiah = "Jeremiah"
    case lamentations = "Lamentations"
    case ezekiel = "Ezekiel"
    case daniel = "Daniel"
    case hosea = "Hosea"
    case joel = "Joel"
    case amos = "Amos"
    case obadiah = "Obadiah"
    case jonah = "Jonah"
    case micah = "Micah"
    case nahum = "Nahum"
    case habakkuk = "Habakkuk"
    case zephaniah = "Zephaniah"
    case haggai = "Haggai"
    case zechariah = "Zechariah"
    case malachi = "Malachi"
    case matthew = "Matthew"
    case mark = "Mark"
    case luke = "Luke"
    case john = "John"
    case acts = "Acts"
    case romans = "Romans"
    case corinthians1 = "1 Corinthians"
    case corinthians2 = "2 Corinthians"
    case galatians = "Galatians"
    case ephesians = "Ephesians"
    case philippians = "Philippians"
    case colossians = "Colossians"
    case thessalonians1 = "1 Thessalonians"
    case thessalonians2 = "2 Thessalonians"
    case timothy1 = "1 Timothy"
    case timothy2 = "2 Timothy"
    case titus = "Titus"
    case philemon = "Philemon"
    case hebrews = "Hebrews"
    case james = "James"
    case peter1 = "1 Peter"
    case peter2 = "2 Peter"
    case john1 = "1 John"
    case john2 = "2 John"
    case john3 = "3 John"
    case jude = "Jude"
    case revelation = "Revelation"
}

enum bookVersion: String, Codable {
    case niv = "niv"
    case krv = "krv"
    case krvBaptism = "krv_baptism"
    case kjv = "kjv"
    case nkjv = "nkjv"
    case cuv = "cuv"
}

