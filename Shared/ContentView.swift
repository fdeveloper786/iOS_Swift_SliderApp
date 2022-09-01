//
//  ContentView.swift
//  Shared
//
//  Created by Mohammad Jawed Ahmad Ansari on 01/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearence = UIPageControl.appearance()
    
    
    var body: some View {
        TabView(selection: $pageIndex ){
            ForEach(pages) {
                page in VStack {
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    if page == pages.last {
                        Button("Sign up", action: goToZero)
                            .buttonStyle(.bordered)
                    }else {
                        Button("next", action: incrementPage)
                    }
                    Spacer()
                }.tag(page.tag)
            }
        }.animation(.easeOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear{
                dotAppearence.currentPageIndicatorTintColor = .black
                dotAppearence.pageIndicatorTintColor = .gray
            }
        
    }
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        pageIndex = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
