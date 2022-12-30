//
//  BereansApp.swift
//  Bereans
//
//  Created by Seungchul Ha on 2022/12/23.
//

import SwiftUI

@main
struct BereansApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
//    init() {
//        fontCheck()
//    }
//    
//    func fontCheck() {
//        // 폰트 체크 하기
//        UIFont.familyNames.sorted().forEach { familyName in
//            print("*** \(familyName) ***")
//            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
//                print("\(fontName)")
//            }
//            print("---------------------")
//        }
//    }
}
