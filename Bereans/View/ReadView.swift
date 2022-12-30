//
//  ReadBibleView.swift
//  Bereans
//
//  Created by Seungchul Ha on 2022/12/28.
//

import SwiftUI

struct ReadView: View {
    
    @EnvironmentObject var readVM: ReadViewModel
    
    @Binding var hideTab: Bool
    var bottomEdge: CGFloat
    
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    
    @State private var draggedOffset = CGSize.zero
    
    @State var footerOffset: CGFloat = -80
    
    @State private var showBookVersionPicker = false
    @State private var showBookPicker = false
    @State private var showSearchText = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        Spacer()
                        Text("\(readVM.bookNameLang) \(readVM.chapter)")
                            .font(.system(size: 40))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 40)
                        
                        Spacer()
                    }
                    .padding(.top, 100)
                    
                    ForEach(readVM.fetchedChapter, id: \.self) { verse in
                        HStack {
                            Text("\(verse.verse)")
                                .frame(maxHeight: .infinity, alignment: .top)
                                .frame(width: 30)
                                .font(.custom(readVM.font, size: 20))
                            
                            Text(verse.text)
                                .font(.custom(readVM.font, size: readVM.fontSize))
                        }
                    }
                    
                    
                }
                .padding(.horizontal, 5)
                .padding(.bottom, 200)
            }
            
            HeaderView()
            
            FooterView()
                .offset(y: footerOffset)
            
        }
        .onAppear {
            readVM.aboutBook()
            readVM.readChapter()
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(spacing: 20) {
            capsuleButton(text: "개역개정", function: "bookversion")
            capsuleButton(text: "창세기 1", function: "bookname&bookchapter")
        }
        .font(.custom(readVM.font, size: 20))
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    @ViewBuilder
    func FooterView() -> some View {
        HStack(spacing: 20) {
            circleBottomButton(text: "arrow.left", function: "prevChapter")
            circleBottomButton(text: "textformat.size.smaller", function: "fontSmaller")
            circleBottomButton(text: "magnifyingglass", function: "searchWord")
            circleBottomButton(text: "textformat.size.larger", function: "fontLarger")
            circleBottomButton(text: "arrow.right", function: "nextChapter")
        }
        .font(.custom(readVM.font, size: 20))
        .frame(maxHeight: .infinity, alignment: .bottom)
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    @ViewBuilder
    func capsuleButton(text: String, function: String) -> some View {
        Button {
            switch function {
            case "bookversion":
                showBookVersionPicker.toggle()
            case "bookname&bookchapter":
                print("bookname&bookchapter")
            default:
                print("default")
            }
            
        } label: {
            Text(text)
        }
        .sheet(isPresented: self.$showBookVersionPicker, content: {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        
                    }
                }
                .navigationTitle("언어 및 버젼")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showBookVersionPicker = false
                        } label: {
                            Image(systemName: "x.circle.fill")
                        }
                    }
                }
            }
        })
        .buttonStyle(CapsuleButton())
    }
    
    @ViewBuilder
    func circleBottomButton(text: String, function: String) -> some View {
        Button {
            switch function {
            case "prevChapter":
                if readVM.chapter > 1 {
                    readVM.chapter -= 1
                    
                    readVM.readChapter()
                }
            case "fontSmaller":
                if readVM.fontSize > 15 {
                    readVM.fontSize -= 5
                }
            case "searchWord":
                print("searchWord")
                
            case "fontLarger":
                if readVM.fontSize < 40 {
                    readVM.fontSize += 5
                }
            case "nextChapter":
                if readVM.chapter < readVM.bookMaxChapter {
                    readVM.chapter += 1
                    
                    readVM.readChapter()
                }
            default:
                print("Hello World")
            }
            
        } label: {
            Image(systemName: text)
                .font(.system(size: 20).bold())
                .foregroundColor(.pink)
                .padding(5)
        }
        .buttonStyle(CircleButton())
    }
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CapsuleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red:0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct CircleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red:0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
