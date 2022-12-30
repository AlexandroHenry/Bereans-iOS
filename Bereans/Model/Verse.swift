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
    
    func language() -> String {
        switch self {
        case .niv, .kjv, .nkjv:
            return "english"
        case .krv, .krvBaptism:
            return "korean"
        case .cuv:
            return "chinese"
        }
    }
}

enum OldTestament: String, Codable {
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
    case kings1 = "1 Kings"
    case kings2 = "2 Kings"
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
    
    func chapter() -> Int {
        switch self {
        case .genesis:
            return 50
        case .exodus:
            return 40
        case .leviticus:
            return 27
        case .numbers:
            return 36
        case .deuteronomy:
            return 34
        case .joshua:
            return 24
        case .judges:
            return 21
        case .ruth:
            return 4
        case .samuel1:
            return 31
        case .samuel2:
            return 24
        case .kings1:
            return 22
        case .kings2:
            return 25
        case .chronicles1:
            return 29
        case .chronicles2:
            return 36
        case .ezra:
            return 10
        case .nehemiah:
            return 13
        case .esther:
            return 10
        case .job:
            return 42
        case .psalms:
            return 150
        case .proverbs:
            return 31
        case .ecclesiastes:
            return 12
        case .songofsongs:
            return 8
        case .isaiah:
            return 66
        case .jeremiah:
            return 52
        case .lamentations:
            return 5
        case .ezekiel:
            return 48
        case .daniel:
            return 12
        case .hosea:
            return 14
        case .joel:
            return 3
        case .amos:
            return 9
        case .obadiah:
            return 1
        case .jonah:
            return 4
        case .micah:
            return 7
        case .nahum:
            return 3
        case .habakkuk:
            return 3
        case .zephaniah:
            return 3
        case .haggai:
            return 2
        case .zechariah:
            return 14
        case .malachi:
            return 4
        }
    }
    func korean() -> String {
        switch self {
        case .genesis:
            return "창세기"
        case .exodus:
            return "출애굽기"
        case .leviticus:
            return "레위기"
        case .numbers:
            return "민수기"
        case .deuteronomy:
            return "신명기"
        case .joshua:
            return "여호수아"
        case .judges:
            return "사사기"
        case .ruth:
            return "룻기"
        case .samuel1:
            return "사무엘상"
        case .samuel2:
            return "사무엘하"
        case .kings1:
            return "열왕기상"
        case .kings2:
            return "열왕기하"
        case .chronicles1:
            return "역대상"
        case .chronicles2:
            return "역대하"
        case .ezra:
            return "에스라"
        case .nehemiah:
            return "느헤미야"
        case .esther:
            return "에스더"
        case .job:
            return "욥기"
        case .psalms:
            return "시편"
        case .proverbs:
            return "잠언"
        case .ecclesiastes:
            return "전도서"
        case .songofsongs:
            return "아가"
        case .isaiah:
            return "이사야"
        case .jeremiah:
            return "예레미야"
        case .lamentations:
            return "예레미야애가"
        case .ezekiel:
            return "에스겔"
        case .daniel:
            return "다니엘"
        case .hosea:
            return "호세아"
        case .joel:
            return "요엘"
        case .amos:
            return "아모스"
        case .obadiah:
            return "오바댜"
        case .jonah:
            return "요나"
        case .micah:
            return "미가"
        case .nahum:
            return "나훔"
        case .habakkuk:
            return "하박국"
        case .zephaniah:
            return "스바냐"
        case .haggai:
            return "학개"
        case .zechariah:
            return "스가랴"
        case .malachi:
            return "말라기"
        }
    }
    func japanese() -> String {
        switch self {
        case .genesis:
            return "創世記"
        case .exodus:
            return "出エジプト記"
        case .leviticus:
            return "レビ記"
        case .numbers:
            return "民数記"
        case .deuteronomy:
            return "申命記"
        case .joshua:
            return "ヨシュア記"
        case .judges:
            return "士師記"
        case .ruth:
            return "ルツ記"
        case .samuel1:
            return "サムエル記上"
        case .samuel2:
            return "サムエル記下"
        case .kings1:
            return "列王記上"
        case .kings2:
            return "列王記下"
        case .chronicles1:
            return "歴代誌上"
        case .chronicles2:
            return "歴代誌下"
        case .ezra:
            return "エズラ記"
        case .nehemiah:
            return "ネヘミヤ記"
        case .esther:
            return "エステル記"
        case .job:
            return "ヨブ記"
        case .psalms:
            return "詩編"
        case .proverbs:
            return "箴言"
        case .ecclesiastes:
            return "コヘレトの言葉"
        case .songofsongs:
            return "雅歌"
        case .isaiah:
            return "イザヤ記"
        case .jeremiah:
            return "エレミヤ記"
        case .lamentations:
            return "哀歌"
        case .ezekiel:
            return "エゼキエル記"
        case .daniel:
            return "ダニエル記"
        case .hosea:
            return "ホセア記"
        case .joel:
            return "ヨエル記"
        case .amos:
            return "アモス記"
        case .obadiah:
            return "オバデア記"
        case .jonah:
            return "ヨナ記"
        case .micah:
            return "ミカ記"
        case .nahum:
            return "ナホム記"
        case .habakkuk:
            return "ハバクク記"
        case .zephaniah:
            return "ゼファニヤ記"
        case .haggai:
            return "ハガイ記"
        case .zechariah:
            return "ゼカリヤ記"
        case .malachi:
            return "マラキ記"
        }
    }
    func chinese() -> String {
        switch self {
        case .genesis:
            return "创世纪"
        case .exodus:
            return "出埃及记"
        case .leviticus:
            return "利未记"
        case .numbers:
            return "民数记"
        case .deuteronomy:
            return "申命记"
        case .joshua:
            return "约书亚记"
        case .judges:
            return "士师记"
        case .ruth:
            return "路得记"
        case .samuel1:
            return "撒母耳记上"
        case .samuel2:
            return "撒母耳记下"
        case .kings1:
            return "列王记上"
        case .kings2:
            return "列王记下"
        case .chronicles1:
            return "历代志上"
        case .chronicles2:
            return "历代志下"
        case .ezra:
            return "以斯拉记"
        case .nehemiah:
            return "尼希米记"
        case .esther:
            return "以斯帖记"
        case .job:
            return "约伯记"
        case .psalms:
            return "诗篇"
        case .proverbs:
            return "箴言"
        case .ecclesiastes:
            return "传道书"
        case .songofsongs:
            return "雅歌"
        case .isaiah:
            return "以赛亚书"
        case .jeremiah:
            return "耶利米书"
        case .lamentations:
            return "耶利米哀歌"
        case .ezekiel:
            return "以西结书"
        case .daniel:
            return "但以理书"
        case .hosea:
            return "何西阿书"
        case .joel:
            return "约珥书"
        case .amos:
            return "阿摩司书"
        case .obadiah:
            return "俄巴底亚书"
        case .jonah:
            return "约拿书"
        case .micah:
            return "弥迦书"
        case .nahum:
            return "那鸿书"
        case .habakkuk:
            return "哈巴谷书"
        case .zephaniah:
            return "西番雅书"
        case .haggai:
            return "哈该书"
        case .zechariah:
            return "撒迦利亚"
        case .malachi:
            return "玛拉基书"
        }
    }
    func french() -> String {
        switch self {
        case .genesis:
            return "Genèse"
        case .exodus:
            return "Exode"
        case .leviticus:
            return "Lévitique"
        case .numbers:
            return "Nombres"
        case .deuteronomy:
            return "Deutéronome"
        case .joshua:
            return "Josué"
        case .judges:
            return "Juges"
        case .ruth:
            return "Ruth"
        case .samuel1:
            return "1 Samuel"
        case .samuel2:
            return "2 Samuel"
        case .kings1:
            return "1 Rois"
        case .kings2:
            return "2 Rois"
        case .chronicles1:
            return "1 Chroniques"
        case .chronicles2:
            return "2 Chroniques"
        case .ezra:
            return "Esdras"
        case .nehemiah:
            return "Néhémie"
        case .esther:
            return "Esther"
        case .job:
            return "Job"
        case .psalms:
            return "Psaume"
        case .proverbs:
            return "Proverbes"
        case .ecclesiastes:
            return "Ecclésiaste"
        case .songofsongs:
            return "Cantique des Cantiqu"
        case .isaiah:
            return "Ésaïe"
        case .jeremiah:
            return "Jérémie"
        case .lamentations:
            return "Lamentations"
        case .ezekiel:
            return "Ézéchiel"
        case .daniel:
            return "Daniel"
        case .hosea:
            return "Osée"
        case .joel:
            return "Joël"
        case .amos:
            return "Amos"
        case .obadiah:
            return "Abdias"
        case .jonah:
            return "Jonas"
        case .micah:
            return "Michée"
        case .nahum:
            return "Nahum"
        case .habakkuk:
            return "Habacuc"
        case .zephaniah:
            return "Sophonie"
        case .haggai:
            return "Aggée"
        case .zechariah:
            return "Zacharie"
        case .malachi:
            return "Malachie"
        }
    }
    func spanish() -> String {
        switch self {
        case .genesis:
            return "Génesis"
        case .exodus:
            return "Éxodo"
        case .leviticus:
            return "Levítico"
        case .numbers:
            return "Números"
        case .deuteronomy:
            return "Deuteronomio"
        case .joshua:
            return "Josué"
        case .judges:
            return "Jueces"
        case .ruth:
            return "Rut"
        case .samuel1:
            return "1 Samuel"
        case .samuel2:
            return "2 Samuel"
        case .kings1:
            return "1 Reyes"
        case .kings2:
            return "2 Reyes"
        case .chronicles1:
            return "1 Crónicas"
        case .chronicles2:
            return "2 Crónicas"
        case .ezra:
            return "Esdras"
        case .nehemiah:
            return "Nehemías"
        case .esther:
            return "Ester"
        case .job:
            return "Job"
        case .psalms:
            return "Salmos"
        case .proverbs:
            return "Proverbios"
        case .ecclesiastes:
            return "Eclesiastés"
        case .songofsongs:
            return "Cantares"
        case .isaiah:
            return "Isaías"
        case .jeremiah:
            return "Jeremías"
        case .lamentations:
            return "Lamentaciones"
        case .ezekiel:
            return "Ezequiel"
        case .daniel:
            return "Daniel"
        case .hosea:
            return "Oseas"
        case .joel:
            return "Joel"
        case .amos:
            return "Amós"
        case .obadiah:
            return "Abdías"
        case .jonah:
            return "Jonás"
        case .micah:
            return "Miqueas"
        case .nahum:
            return "Nahum"
        case .habakkuk:
            return "Habacuc"
        case .zephaniah:
            return "Sofonías"
        case .haggai:
            return "Hageo"
        case .zechariah:
            return "Zacarías"
        case .malachi:
            return "Malaquías"
        }
    }
    func german() -> String {
        switch self {
        case .genesis:
            return "1.Mose"
        case .exodus:
            return "2.Mose"
        case .leviticus:
            return "3.Mose"
        case .numbers:
            return "4.Mose"
        case .deuteronomy:
            return "5.Mose"
        case .joshua:
            return "Josua"
        case .judges:
            return "Richter"
        case .ruth:
            return "Ruth"
        case .samuel1:
            return "1.Samuel"
        case .samuel2:
            return "2.Samuel"
        case .kings1:
            return "1.Könige"
        case .kings2:
            return "2.Könige"
        case .chronicles1:
            return "1.Chronik"
        case .chronicles2:
            return "2.Chronik"
        case .ezra:
            return "Esra"
        case .nehemiah:
            return "Nehemia"
        case .esther:
            return "Esther"
        case .job:
            return "Hiob"
        case .psalms:
            return "Psalm"
        case .proverbs:
            return "Sprüche"
        case .ecclesiastes:
            return "Prediger"
        case .songofsongs:
            return "Hohelied"
        case .isaiah:
            return "Jesaja"
        case .jeremiah:
            return "Jeremia"
        case .lamentations:
            return "Klagelieder"
        case .ezekiel:
            return "Hesekiel"
        case .daniel:
            return "Daniel"
        case .hosea:
            return "Hosea"
        case .joel:
            return "Joel"
        case .amos:
            return "Amos"
        case .obadiah:
            return "Obadja"
        case .jonah:
            return "Jona"
        case .micah:
            return "Micha"
        case .nahum:
            return "Nahum"
        case .habakkuk:
            return "Habakuk"
        case .zephaniah:
            return "Zephanja"
        case .haggai:
            return "Haggai"
        case .zechariah:
            return "Sacharja"
        case .malachi:
            return "Maleachi"
        }
    }
    func russian() -> String {
        switch self {
        case .genesis:
            return "Бытие"
        case .exodus:
            return "Исход"
        case .leviticus:
            return "Левит"
        case .numbers:
            return "Числа"
        case .deuteronomy:
            return "Второзаконие"
        case .joshua:
            return "Иисус Навин"
        case .judges:
            return "Книга Судей"
        case .ruth:
            return "Руфь"
        case .samuel1:
            return "1-я Царств"
        case .samuel2:
            return "2-я Царств"
        case .kings1:
            return "3-я Царств"
        case .kings2:
            return "4-я Царств"
        case .chronicles1:
            return "1 Пар."
        case .chronicles2:
            return "2 Пар."
        case .ezra:
            return "Ездра"
        case .nehemiah:
            return "Неемия"
        case .esther:
            return "Есфирь"
        case .job:
            return "Иов"
        case .psalms:
            return "Псалтирь"
        case .proverbs:
            return "Притчи"
        case .ecclesiastes:
            return "Екклесиаст"
        case .songofsongs:
            return "Песни Песней"
        case .isaiah:
            return "Исаия"
        case .jeremiah:
            return "Иеремия"
        case .lamentations:
            return "Плач Иеремии"
        case .ezekiel:
            return "Иезекииль"
        case .daniel:
            return "Даниил"
        case .hosea:
            return "Осия"
        case .joel:
            return "Иоиль"
        case .amos:
            return "Амос"
        case .obadiah:
            return "Авдия"
        case .jonah:
            return "Иона"
        case .micah:
            return "Михей"
        case .nahum:
            return "Наум"
        case .habakkuk:
            return "Аввакум"
        case .zephaniah:
            return "Софония"
        case .haggai:
            return "Аггей"
        case .zechariah:
            return "Захария"
        case .malachi:
            return "Малахия"
        }
    }
    func greek() -> String {
        switch self {
        case .genesis:
            return "Γένεση"
        case .exodus:
            return "Έξοδος"
        case .leviticus:
            return "Λευιτικό"
        case .numbers:
            return "Αριθμοί"
        case .deuteronomy:
            return "Δευτερονόμιο"
        case .joshua:
            return "Ιησούς του Ναυή"
        case .judges:
            return "Κριτές"
        case .ruth:
            return "Ρουθ"
        case .samuel1:
            return "1 Σαμουήλ"
        case .samuel2:
            return "2 Σαμουήλ"
        case .kings1:
            return "1 Βασιλέων"
        case .kings2:
            return "2 Βασιλέων"
        case .chronicles1:
            return "1 Χρονικών"
        case .chronicles2:
            return "2 Χρονικών"
        case .ezra:
            return "Έσδρας"
        case .nehemiah:
            return "Νεεμίας"
        case .esther:
            return "Εσθήρ"
        case .job:
            return "Ιώβ"
        case .psalms:
            return "Ψαλμοί"
        case .proverbs:
            return "Παροιμίες"
        case .ecclesiastes:
            return "Εκκλησιαστής"
        case .songofsongs:
            return "Άσμα Σολομώντος"
        case .isaiah:
            return "Ησαΐας"
        case .jeremiah:
            return "Ιερεμίας"
        case .lamentations:
            return "Θρήνοι"
        case .ezekiel:
            return "Ιεζεκιήλ"
        case .daniel:
            return "Δανιήλ"
        case .hosea:
            return "Ωσηέ"
        case .joel:
            return "Ιωήλ"
        case .amos:
            return "Αμώς"
        case .obadiah:
            return "Αβδιού"
        case .jonah:
            return "Ιωνάς"
        case .micah:
            return "Μιχαίας"
        case .nahum:
            return "Ναούμ"
        case .habakkuk:
            return "Αββακούμ"
        case .zephaniah:
            return "Σοφονίας"
        case .haggai:
            return "Αγγαίος"
        case .zechariah:
            return "Ζαχαρίας"
        case .malachi:
            return "Μαλαχίας"
        }
    }
    func hindi() -> String {
        switch self {
        case .genesis:
            return "उत्पत्ति"
        case .exodus:
            return "निर्गमन"
        case .leviticus:
            return "लैव्यवस्था"
        case .numbers:
            return "गिनती"
        case .deuteronomy:
            return "व्यवस्थाविवरण"
        case .joshua:
            return "यहोशू"
        case .judges:
            return "न्यायियों"
        case .ruth:
            return "रूत"
        case .samuel1:
            return "1 शमूएल"
        case .samuel2:
            return "2 शमूएल"
        case .kings1:
            return "1 राजा"
        case .kings2:
            return "2 राजा"
        case .chronicles1:
            return "1 इतिहास"
        case .chronicles2:
            return "2 इतिहास"
        case .ezra:
            return "एज्रा"
        case .nehemiah:
            return "नहेमायाह"
        case .esther:
            return "एस्तेर"
        case .job:
            return "अय्यूब"
        case .psalms:
            return "भजन संहिता"
        case .proverbs:
            return "नीतिवचन"
        case .ecclesiastes:
            return "सभोपदेशक"
        case .songofsongs:
            return "श्रेष्ठगीत"
        case .isaiah:
            return "यशायाह"
        case .jeremiah:
            return "यिर्मयाह"
        case .lamentations:
            return "विलापगीत"
        case .ezekiel:
            return "यहेजकेल"
        case .daniel:
            return "दानिय्येल"
        case .hosea:
            return "होशे"
        case .joel:
            return "योएल"
        case .amos:
            return "आमोस"
        case .obadiah:
            return "ओबद्दाह"
        case .jonah:
            return "योना"
        case .micah:
            return "मीका"
        case .nahum:
            return "नहूम"
        case .habakkuk:
            return "हबक्कूक"
        case .zephaniah:
            return "सपन्याह"
        case .haggai:
            return "हाग्गै"
        case .zechariah:
            return "जकर्याह"
        case .malachi:
            return "मलाकी"
        }
    }
    func portuguese() -> String {
        switch self {
        case .genesis:
            return "Gênesis"
        case .exodus:
            return "Êxodo"
        case .leviticus:
            return "Levítico"
        case .numbers:
            return "Números"
        case .deuteronomy:
            return "Deutoronômio"
        case .joshua:
            return "Josué"
        case .judges:
            return "Juízes"
        case .ruth:
            return "Rute"
        case .samuel1:
            return "1 Samuel"
        case .samuel2:
            return "2 Samuel"
        case .kings1:
            return "1 Reis"
        case .kings2:
            return "2 Reis"
        case .chronicles1:
            return "1 Crônicas"
        case .chronicles2:
            return "2 Crônicas"
        case .ezra:
            return "Esdras"
        case .nehemiah:
            return "Neemias"
        case .esther:
            return "Ester"
        case .job:
            return "Jó"
        case .psalms:
            return "Salmos"
        case .proverbs:
            return "Provérbios"
        case .ecclesiastes:
            return "Eclesiastes"
        case .songofsongs:
            return "Cantares de Salomão"
        case .isaiah:
            return "Isaías"
        case .jeremiah:
            return "Jeremías"
        case .lamentations:
            return "Lamentações"
        case .ezekiel:
            return "Ezequiel"
        case .daniel:
            return "Daniel"
        case .hosea:
            return "Oséias"
        case .joel:
            return "Joel"
        case .amos:
            return "Amós"
        case .obadiah:
            return "Obadias"
        case .jonah:
            return "Jonas"
        case .micah:
            return "Miquéias"
        case .nahum:
            return "Naum"
        case .habakkuk:
            return "Habacuque"
        case .zephaniah:
            return "Sofonias"
        case .haggai:
            return "Ageu"
        case .zechariah:
            return "Zacarias"
        case .malachi:
            return "Malaquias"
        }
    }
}

enum NewTestament: String, Codable {
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
    
    func chapter() -> Int {
        switch self {
        case .matthew:
            return 28
        case .mark:
            return 16
        case .luke:
            return 24
        case .john:
            return 21
        case .acts:
            return 28
        case .romans:
            return 16
        case .corinthians1:
            return 16
        case .corinthians2:
            return 13
        case .galatians:
            return 6
        case .ephesians:
            return 6
        case .philippians:
            return 4
        case .colossians:
            return 4
        case .thessalonians1:
            return 5
        case .thessalonians2:
            return 3
        case .timothy1:
            return 6
        case .timothy2:
            return 4
        case .titus:
            return 3
        case .philemon:
            return 1
        case .hebrews:
            return 13
        case .james:
            return 5
        case .peter1:
            return 5
        case .peter2:
            return 3
        case .john1:
            return 5
        case .john2:
            return 1
        case .john3:
            return 1
        case .jude:
            return 1
        case .revelation:
            return 22
        }
    }
    func korean() -> String {
        switch self {
        case .matthew:
            return "마태복음"
        case .mark:
            return "마가복음"
        case .luke:
            return "마가복음"
        case .john:
            return "요한복음"
        case .acts:
            return "사도행전"
        case .romans:
            return "로마서"
        case .corinthians1:
            return "고린도전서"
        case .corinthians2:
            return "고린도후서"
        case .galatians:
            return "갈라디아서"
        case .ephesians:
            return "에베소서"
        case .philippians:
            return "빌립보서"
        case .colossians:
            return "골로새서"
        case .thessalonians1:
            return "데살로니가전서"
        case .thessalonians2:
            return "데살로니가후서"
        case .timothy1:
            return "디모데전서"
        case .timothy2:
            return "디모데후서"
        case .titus:
            return "디도서"
        case .philemon:
            return "빌레몬서"
        case .hebrews:
            return "히브리서"
        case .james:
            return "야고보서"
        case .peter1:
            return "베드로전서"
        case .peter2:
            return "베드로후서"
        case .john1:
            return "요한일서"
        case .john2:
            return "요한2서"
        case .john3:
            return "요한3서"
        case .jude:
            return "유다서"
        case .revelation:
            return "요한계시록"
        }
    }
    func japanese() -> String {
        switch self {
        case .matthew:
            return "マタイによる福音書"
        case .mark:
            return "マルコによる福音書"
        case .luke:
            return "ルカによる福音書"
        case .john:
            return "ヨハネによる福音書"
        case .acts:
            return "使徒言行録"
        case .romans:
            return "ローマの信徒への手紙"
        case .corinthians1:
            return "コリントの信徒への手紙一"
        case .corinthians2:
            return "コリントの信徒への手紙二"
        case .galatians:
            return "ガラテヤ"
        case .ephesians:
            return "エフェソ"
        case .philippians:
            return "フィリピ"
        case .colossians:
            return "コロサイ"
        case .thessalonians1:
            return "1 テサロニケ"
        case .thessalonians2:
            return "2 テサロニケ"
        case .timothy1:
            return "1 テモテへ"
        case .timothy2:
            return "2 テモテへ"
        case .titus:
            return "テトスへの手紙"
        case .philemon:
            return "フィレモンへ"
        case .hebrews:
            return "ヘブライ人へ"
        case .james:
            return "ヤコブ"
        case .peter1:
            return "1 ペトロ"
        case .peter2:
            return "2 ペトロ"
        case .john1:
            return "1 ヨハネ"
        case .john2:
            return "2 ヨハネ"
        case .john3:
            return "3 ヨハネ"
        case .jude:
            return "ユダの手紙"
        case .revelation:
            return "ヨハネの黙示録"
        }
    }
    func chinese() -> String {
        switch self {
        case .matthew:
            return "马太福音"
        case .mark:
            return "马可福音"
        case .luke:
            return "路加福音"
        case .john:
            return "约翰福音"
        case .acts:
            return "使徒行传"
        case .romans:
            return "罗马书"
        case .corinthians1:
            return "歌林多前书"
        case .corinthians2:
            return "歌林多后书"
        case .galatians:
            return "加拉太书"
        case .ephesians:
            return "以弗所书"
        case .philippians:
            return "腓利比书"
        case .colossians:
            return "歌罗西书"
        case .thessalonians1:
            return "帖撒罗尼迦前书 1"
        case .thessalonians2:
            return "帖撒罗尼迦后书 2"
        case .timothy1:
            return "提摩太前书 1"
        case .timothy2:
            return "提摩太后书 2"
        case .titus:
            return "提多书"
        case .philemon:
            return "腓利门书"
        case .hebrews:
            return "希伯来书"
        case .james:
            return "雅各书"
        case .peter1:
            return "彼得前书 1"
        case .peter2:
            return "彼得后书 2"
        case .john1:
            return "约翰一书 1"
        case .john2:
            return "约翰二书 2"
        case .john3:
            return "约翰三书 3"
        case .jude:
            return "犹大书"
        case .revelation:
            return "启示录"
        }
    }
    func french() -> String {
        switch self {
        case .matthew:
            return "Matthieu"
        case .mark:
            return "Marc"
        case .luke:
            return "Luc"
        case .john:
            return "Jean"
        case .acts:
            return "Actes"
        case .romans:
            return "Romains"
        case .corinthians1:
            return "1 Corinthiens"
        case .corinthians2:
            return "2 Corinthiens"
        case .galatians:
            return "Galates"
        case .ephesians:
            return "Éphésiens"
        case .philippians:
            return "Philippiens"
        case .colossians:
            return "Colossiens"
        case .thessalonians1:
            return "1 Thessaloniciens"
        case .thessalonians2:
            return "2 Thessaloniciens"
        case .timothy1:
            return "1 Timothée"
        case .timothy2:
            return "2 Timothée"
        case .titus:
            return "Tite"
        case .philemon:
            return "Philémon"
        case .hebrews:
            return "Hébreux"
        case .james:
            return "Jacques"
        case .peter1:
            return "1 Pierre"
        case .peter2:
            return "2 Pierre"
        case .john1:
            return "1 Jean"
        case .john2:
            return "2 Jean"
        case .john3:
            return "3 Jean"
        case .jude:
            return "Jude"
        case .revelation:
            return "Apocalypse"
        }
    }
    func spanish() -> String {
        switch self {
        case .matthew:
            return "Mateo"
        case .mark:
            return "Marcos"
        case .luke:
            return "Lucas"
        case .john:
            return "Juan"
        case .acts:
            return "Hechos"
        case .romans:
            return "Romanos"
        case .corinthians1:
            return "1 Corintios"
        case .corinthians2:
            return "2 Corintios"
        case .galatians:
            return "Gálatas"
        case .ephesians:
            return "Efesios"
        case .philippians:
            return "Filipenses"
        case .colossians:
            return "Colosenses"
        case .thessalonians1:
            return "1 Tesalonicenses"
        case .thessalonians2:
            return "2 Tesalonicenses"
        case .timothy1:
            return "1 Timoteo"
        case .timothy2:
            return "2 Timoteo"
        case .titus:
            return "Tito"
        case .philemon:
            return "Filemón"
        case .hebrews:
            return "Hebreos"
        case .james:
            return "Santiago"
        case .peter1:
            return "1 Pedro"
        case .peter2:
            return "2 Pedro"
        case .john1:
            return "1 Juan"
        case .john2:
            return "2 Juan"
        case .john3:
            return "3 Juan"
        case .jude:
            return "Judas"
        case .revelation:
            return "Apocalipsis"
        }
    }
    func german() -> String {
        switch self {
        case .matthew:
            return "Matthäus"
        case .mark:
            return "Markus"
        case .luke:
            return "Lukas"
        case .john:
            return "Johannes"
        case .acts:
            return "Apostelgeschichte"
        case .romans:
            return "Römer"
        case .corinthians1:
            return "1.Korinther"
        case .corinthians2:
            return "2.Korinther"
        case .galatians:
            return "Galater"
        case .ephesians:
            return "Epheser"
        case .philippians:
            return "Philipper"
        case .colossians:
            return "Kolosser"
        case .thessalonians1:
            return "1.Thessalonicher"
        case .thessalonians2:
            return "2.Thessalonicher"
        case .timothy1:
            return "1.Timotheus"
        case .timothy2:
            return "2.Timotheus"
        case .titus:
            return "Titus"
        case .philemon:
            return "Philemon"
        case .hebrews:
            return "Hebräer"
        case .james:
            return "Jakobus"
        case .peter1:
            return "1.Petrus"
        case .peter2:
            return "2.Petrus"
        case .john1:
            return "1.Johannes"
        case .john2:
            return "2.Johannes"
        case .john3:
            return "3.Johannes"
        case .jude:
            return "Judas"
        case .revelation:
            return "Offenbarung"


        }
    }
    func russian() -> String {
        switch self {
        case .matthew:
            return "от Матфея"
        case .mark:
            return "от Марка"
        case .luke:
            return "от Луки"
        case .john:
            return "от Иоанна"
        case .acts:
            return "Деяния Апостолов"
        case .romans:
            return "Послание к Римлянам"
        case .corinthians1:
            return "1-е Коринфянам"
        case .corinthians2:
            return "2-е к Коринфянам"
        case .galatians:
            return "Галатам"
        case .ephesians:
            return "Ефесянам"
        case .philippians:
            return "Филиппийцам"
        case .colossians:
            return "Колоссянам"
        case .thessalonians1:
            return "1-е Фессалоникийцам"
        case .thessalonians2:
            return "2-е Фессалоникийцам"
        case .timothy1:
            return "1-е Тимофею"
        case .timothy2:
            return "2-е Тимофею"
        case .titus:
            return "Титу"
        case .philemon:
            return "Филимону"
        case .hebrews:
            return "Евреям"
        case .james:
            return "Иакова"
        case .peter1:
            return "1 Петра"
        case .peter2:
            return "2 Петра"
        case .john1:
            return "1 Иоанна"
        case .john2:
            return "2 Иоанна"
        case .john3:
            return "3 Иоанна"
        case .jude:
            return "Джуд"
        case .revelation:
            return "Откровение"
        }
    }
    func greek() -> String {
        switch self {
        case .matthew:
            return "Ματθαίος"
        case .mark:
            return "Μάρκος"
        case .luke:
            return "Λουκάς"
        case .john:
            return "Ιωαννη"
        case .acts:
            return "Πράξεις"
        case .romans:
            return "Ρωμαίους"
        case .corinthians1:
            return "Κορινθίους α'"
        case .corinthians2:
            return "Κορινθίους b'"
        case .galatians:
            return "Γαλάτες"
        case .ephesians:
            return "Εφεσίους"
        case .philippians:
            return "Φιλιππησίους"
        case .colossians:
            return "Κολοσσαείς"
        case .thessalonians1:
            return "1 Θεσσαλονικείς"
        case .thessalonians2:
            return "2 Θεσσαλονικείς"
        case .timothy1:
            return "1 Τιμόθεο"
        case .timothy2:
            return "2 Τιμόθεο"
        case .titus:
            return "Τίτος"
        case .philemon:
            return "Φιλήμονα"
        case .hebrews:
            return "Εβραίους"
        case .james:
            return "Ιακωβου"
        case .peter1:
            return "1 Πέτρου"
        case .peter2:
            return "2 Πέτρου"
        case .john1:
            return "1 Ιωάννη"
        case .john2:
            return "2 Ιωάννη"
        case .john3:
            return "3 Ιωάννη"
        case .jude:
            return "Ιουδα"
        case .revelation:
            return "Αποκάλυψη"
        }
    }
    func hindi() -> String {
        switch self {
        case .matthew:
            return "मत्ती"
        case .mark:
            return "मरकुस"
        case .luke:
            return "लूका"
        case .john:
            return "यूहन्ना"
        case .acts:
            return "अधिनियमों"
        case .romans:
            return "रोमियो"
        case .corinthians1:
            return "1 कुरिन्थियों"
        case .corinthians2:
            return "2 कुरिन्थियों"
        case .galatians:
            return "गलातियों"
        case .ephesians:
            return "इफिसियों"
        case .philippians:
            return "फिलिप्पियों"
        case .colossians:
            return "कुलुस्सियों"
        case .thessalonians1:
            return "1 थिस्सलुनीकियों"
        case .thessalonians2:
            return "2 थिस्सलुनीकियों"
        case .timothy1:
            return "1 तीमुथियुस"
        case .timothy2:
            return "2 तीमुथियुस"
        case .titus:
            return "तीतुस"
        case .philemon:
            return "फिलेमोन"
        case .hebrews:
            return "इब्रानियों"
        case .james:
            return "याकूब"
        case .peter1:
            return "1 पतरस"
        case .peter2:
            return "2 पतरस"
        case .john1:
            return "1 यूहन्ना"
        case .john2:
            return "2 यूहन्ना"
        case .john3:
            return "3 यूहन्ना"
        case .jude:
            return "यहूदा"
        case .revelation:
            return "प्रकाशित वाक्य"
        }
    }
    func portuguese() -> String {
        switch self {
        case .matthew:
            return "Mateus"
        case .mark:
            return "Marcos"
        case .luke:
            return "Lucas"
        case .john:
            return "João"
        case .acts:
            return "Atos"
        case .romans:
            return "Romanos"
        case .corinthians1:
            return "1 Coríntios"
        case .corinthians2:
            return "2 Coríntios"
        case .galatians:
            return "Gálatas"
        case .ephesians:
            return "Efésios"
        case .philippians:
            return "Filipenses"
        case .colossians:
            return "Colossensses"
        case .thessalonians1:
            return "1 Tessalonicenses"
        case .thessalonians2:
            return "2 Tessalonicenses"
        case .timothy1:
            return "1 Timóteo"
        case .timothy2:
            return "2 Timóteo"
        case .titus:
            return "Tito"
        case .philemon:
            return "Filemon"
        case .hebrews:
            return "Hebreus"
        case .james:
            return "Tiago"
        case .peter1:
            return "1 Pedro"
        case .peter2:
            return "2 Pedro"
        case .john1:
            return "1 João"
        case .john2:
            return "2 João"
        case .john3:
            return "3 João"
        case .jude:
            return "Judas"
        case .revelation:
            return "Apocalipse"
        }
    }
}

var old_testament: [BookName] = [.genesis, .exodus, .leviticus, .numbers, .deuteronomy, .joshua, .judges, .ruth, .samuel1, .samuel2, .king1, .king2, .chronicles1, .chronicles2, .ezra, .nehemiah, .esther, .job, .psalms, .proverbs, .ecclesiastes, .songofsongs, .isaiah, .jeremiah, .lamentations, .ezekiel, .daniel, .hosea, .joel, .amos, .obadiah, .jonah, .micah, .nahum, .habakkuk, .zephaniah, .haggai, .zechariah, .malachi]

var new_testament: [BookName] = [.matthew, .mark, .luke, .john, .acts, .romans, .corinthians1, .corinthians2, .galatians, .ephesians, .philippians, .colossians, .thessalonians1, .thessalonians2, .timothy1, .timothy2, .titus, .philemon, .hebrews, .james, .peter1, .peter2, .john1, .john2, .john3, .jude, .revelation]
