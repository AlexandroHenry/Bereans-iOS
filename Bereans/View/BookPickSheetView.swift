//
//  BookPickSheetView.swift
//  Bereans
//
//  Created by Seungchul Ha on 2022/12/30.
//

import SwiftUI

struct BookPickSheetView: View {
    
    @EnvironmentObject var readVM: ReadViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var showOld: Bool = false
    @State private var showNew: Bool = false
    @State private var showChapter: Bool = false
    
    @State var currentBook: String = ""
    @State var currentBookChapter: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Text("성경")
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
                        Button {
                            withAnimation {
                                showOld.toggle()
                            }
                        } label: {
                            HStack {
                                Text("구약성경")
                                Spacer()
                                Image(systemName: showOld ? "chevron.down" : "chevron.right")
                            }
                            .font(.custom(readVM.font, size: 20))
                            .foregroundColor(showOld ? Color.pink : Color.primary)
                        }
                        
                        if showOld {
                            ForEach(old_testament, id: \.self) { book in
                                Button {
                                    withAnimation {
                                        if currentBook == book.rawValue {
                                            showChapter = false
                                        } else {
                                            currentBook = book.rawValue
                                            showChapter = true
                                        }
                                        
                                    }
                                } label: {
                                    Text(book.korean())
                                        .foregroundColor(showChapter && (book.rawValue == currentBook) ? .pink : .primary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                if showChapter && (book.rawValue == currentBook) {
                                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 5)) {
                                        ForEach(1...book.chapter() , id: \.self) { chapter in
                                            Button {
                                                readVM.bookName = book
                                                print(book)
                                                readVM.chapter = chapter
                                                readVM.readChapter()
                                                dismiss()
                                            } label: {
                                                Text("\(chapter)")
                                            }
                                            .buttonStyle(ChapterButton())
                                        }
                                    }
                                }
                            }
                        }
                        
                        Button {
                            withAnimation {
                                showNew.toggle()
                            }
                        } label: {
                            HStack {
                                Text("신약성경")
                                Spacer()
                                Image(systemName: showNew ? "chevron.down" : "chevron.right")
                            }
                            .font(.custom(readVM.font, size: 20))
                            .foregroundColor(showNew ? Color.pink : Color.primary)
                        }
                        
                        if showNew {
                            ForEach(new_testament, id: \.self) { book in
                                Button {
                                    withAnimation {
                                        if currentBook == book.rawValue {
                                            showChapter = false
                                        } else {
                                            currentBook = book.rawValue
                                            showChapter = true
                                        }
                                    }
                                } label: {
                                    Text(book.korean())
                                        .foregroundColor(showChapter && (book.rawValue == currentBook) ? .pink : .primary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                if showChapter && (book.rawValue == currentBook) {
                                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 5)) {
                                        ForEach(1...book.chapter() , id: \.self) { chapter in
                                            Button {
                                                readVM.bookName = book
                                                print(book)
                                                readVM.chapter = chapter
                                                readVM.readChapter()
                                                dismiss()
                                            } label: {
                                                Text("\(chapter)")
                                            }
                                            .buttonStyle(ChapterButton())
                                        }
                                    }
                                }
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

struct BookPickSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ChapterButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 40, height: 40)
            .padding()
            .background(.black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            
    }
}
