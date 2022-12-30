//
//  VersionPickSheetView.swift
//  Bereans
//
//  Created by Seungchul Ha on 2022/12/30.
//

import SwiftUI

struct VersionPickSheetView: View {
    
    @EnvironmentObject var readVM: ReadViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var showKoreanVersion: Bool = false
    @State private var showEnglishVersion: Bool = false
    @State private var showChineseVersion: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Text("언어 및 번역")
                            .font(.custom(readVM.font, size: 30).bold())
                            
                        Spacer()
                        
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 40))
                        }
                    }
                    
                    VStack(spacing: 30) {
                        HStack {
                            Button {
                                showKoreanVersion.toggle()
                            } label: {
                                HStack {
                                    Text("🇰🇷")
                                        .padding(.trailing, 5)
                                    Text("한국어")
                                    Spacer()
                                    Image(systemName: showKoreanVersion ? "chevron.down" : "chevron.right")
                                }
                                .font(.custom(readVM.font, size: 20))
                                .foregroundColor(showKoreanVersion ? Color.pink : Color.primary)
                            }
                        }
                        
                        if showKoreanVersion {
                            HStack {
                                Button {
                                    readVM.version = .krv
                                    readVM.readChapter()
                                    dismiss()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("개역개정")
                                        Text("Korean Revised Version")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            HStack {
                                Button {
                                    readVM.version = .krvBaptism
                                    readVM.readChapter()
                                    dismiss()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("개역개정: 침례")
                                        Text("Korean Revised Version: Baptism")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                        
                        HStack {
                            Button {
                                showEnglishVersion.toggle()
                            } label: {
                                HStack {
                                    Text("🇺🇸")
                                        .padding(.trailing, 5)
                                    Text("English")
                                    Spacer()
                                    Image(systemName: showEnglishVersion ? "chevron.down" : "chevron.right")
                                }
                                .font(.custom(readVM.font, size: 20))
                                .foregroundColor(showEnglishVersion ? Color.pink : Color.primary)
                            }
                        }
                        
                        if showEnglishVersion {
                            HStack {
                                Button {
                                    readVM.version = .niv
                                    readVM.readChapter()
                                    dismiss()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("NIV")
                                        Text("New International Versions")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            HStack {
                                Button {
                                    readVM.version = .kjv
                                    readVM.readChapter()
                                    dismiss()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("KJV")
                                        Text("the King James Version")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            HStack {
                                Button {
                                    readVM.version = .nkjv
                                    readVM.readChapter()
                                    dismiss()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("NKJV")
                                        Text("New King James Version")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                        
                        HStack {
                            Button {
                                showChineseVersion.toggle()
                            } label: {
                                HStack {
                                    Text("🇨🇳")
                                        .padding(.trailing, 5)
                                    Text("中國語")
                                    Spacer()
                                    Image(systemName: showChineseVersion ? "chevron.down" : "chevron.right")
                                }
                                .font(.custom(readVM.font, size: 20))
                                .foregroundColor(showChineseVersion ? Color.pink : Color.primary)
                            }
                        }
                        
                        if showChineseVersion {
                            HStack {
                                Button {
                                    readVM.version = .cuv
                                    readVM.readChapter()
                                    dismiss()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("CUV")
                                        Text("The Chinese Union Version")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.vertical, 20)

                }
                .padding(.horizontal)
                .padding(.vertical)
            }
        }
    }
}

struct VersionPickSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
