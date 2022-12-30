//
//  ReadViewModel.swift
//  Bereans
//
//  Created by Seungchul Ha on 2022/12/28.
//

import Foundation

class ReadViewModel: ObservableObject {

    // MARK: ReadView Bible Chapter
    @Published var bookName: BookName = .genesis
    @Published var chapter: Int = 1
    @Published var version: bookVersion = .krv
    @Published var bookPart: BookPart = .old
    @Published var fetchedChapter: [Verse] = []
    
    @Published var bookNameLang: String = ""
    
    @Published var font = Font.nanumSquareRoundR.rawValue
    @Published var fontSize: CGFloat = 20
    
    @Published var searchVersionQuery = ""
    
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
                    
                    if (self.version == bookVersion.krv) || (self.version == bookVersion.krvBaptism) {
                        self.bookNameLang = self.bookName.korean()
                    }
                    
                    if (self.version == bookVersion.niv) || (self.version == bookVersion.nkjv) || (self.version == bookVersion.kjv) {
                        self.bookNameLang = self.bookName.rawValue
                    }
                    
                    if (self.version == bookVersion.cuv) {
                        self.bookNameLang = self.bookName.chinese()
                    }
                    
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }
        .resume()
    }
}
