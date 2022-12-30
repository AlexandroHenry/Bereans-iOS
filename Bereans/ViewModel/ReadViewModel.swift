//
//  ReadViewModel.swift
//  Bereans
//
//  Created by Seungchul Ha on 2022/12/28.
//

import Foundation

class ReadViewModel: ObservableObject {

    @Published var bookName: BookName = .genesis
    @Published var chapter: Int = 1
    @Published var version: bookVersion = .krv
    
    @Published var bookMaxChapter: Int = 0
    
    @Published var bookNameLang: String = ""
    
//    @Published var englishBookname: String = ""
//    @Published var koreanBookname: String = ""
//    @Published var japaneseBookname: String = ""
//    @Published var frenchBookname: String = ""
//    @Published var spanishBookname: String = ""
//    @Published var chineseBookname: String = ""
//    @Published var germanBookname: String = ""
//    @Published var russianBookname: String = ""
//    @Published var greekBookname: String = ""
//    @Published var hindiBookname: String = ""
//    @Published var portugueseBookname: String = ""
    
    @Published var font = Font.nanumSquareRoundR.rawValue
    @Published var fontSize: CGFloat = 20
    
    @Published var fetchedChapter: [Verse] = []

    
    var baseURL: String = "http://146.56.168.117"
    
    func readChapter() {
        
        let url = "\(baseURL)/readbible/\(bookName.rawValue)&chapter=\(chapter)&version=\(version.rawValue)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            guard let APIData = data else {
                print("No Data Found")
                return
            }
            
            do {
                let chapter = try JSONDecoder().decode(APIChapterResult.self, from: APIData)
                
                DispatchQueue.main.async {
                    self.fetchedChapter = chapter.verses
                    
//                    print(chapter.verses)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }
        .resume()
    }
    
    func aboutBook() {
        let url = "\(baseURL)/bookinfo/\(bookName.rawValue)"
        
        print(url)
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            guard let APIData = data else {
                print("No Data Found")
                return
            }
            
            do {
                let bookInfo = try JSONDecoder().decode(BookInfo.self, from: APIData)
                
                DispatchQueue.main.async {
//                    self.fetchedChapter = chapter.verses
                    
                    self.bookMaxChapter = bookInfo.chapter
                    
                    switch self.version {
                    case .krv, .krvBaptism:
                        self.bookNameLang = bookInfo.korean;
                    case .niv, .kjv, .nkjv:
                        self.bookNameLang = bookInfo.english;
                    case .cuv:
                        self.bookNameLang = bookInfo.chinese;
                    default:
                        self.bookNameLang = bookInfo.korean;
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
}
