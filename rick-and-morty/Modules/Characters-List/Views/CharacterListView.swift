//
//  CharacterListView.swift
//  rick-and-morty
//
//  Created by Celal on 7.10.2024.
//

import SwiftUI
import Refresh

struct CharacterListView: View {
    var viewModel = CharacterListViewModel.shared
    @State private var itemList: [CharacterResult] = []
    @State private var pageRange : Range<Int> = (1..<2)
    @State private var charList: CharacterListModel?
    @State private var showError = false
    
    @State private var headerRefreshing: Bool = false
    @State private var footerRefreshing: Bool = false
    @State private var noMore: Bool = false
    
    var body: some View {
        NavigationView {
            if !itemList.isEmpty {
                ScrollView {
                    RefreshHeader(refreshing: $headerRefreshing, action: reload) { progress in
                                        if self.headerRefreshing {
                                            Text("refreshing...")
                                        } else {
                                            Text("Pull to refresh")
                                        }
                                    }
                    LazyVStack(alignment: .leading) {
                        ForEach(itemList) { character in
                            CharacterView(character: character)
                        }
                    }
                    RefreshFooter(refreshing: $footerRefreshing, action: loadMore) {
                                        if self.noMore {
                                            Text("No more data !")
                                        } else {
                                            Text("refreshing...")
                                        }
                                    }
                                    .noMore(noMore)
                                    .preload(offset: 50)
                }
                .enableRefresh()
            } else if charList == nil {
                Text("No data available.")
                    .font(.headline)
                    .foregroundColor(.gray)
            } else {
                ProgressView("Loading...")
            }
        }
        .navigationTitle("Characters")
        .task {
            let newItems = await receiveItems(currPage: 1)
            itemList.append(contentsOf: newItems)
        }
        .alert("Failed to fetch data", isPresented: $showError, actions: {})
    }
    
    private func receiveItems(currPage:Int) async -> [CharacterResult] {
        do{
            let newItems = try await viewModel.getCharacters(page: currPage).results
            return newItems
        }catch{
            print(error)
            return []
        }
        
    }
    private func loadMore(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            Task{
                pageRange = (pageRange.lowerBound..<pageRange.upperBound + 1)
                let newItems = await receiveItems(currPage: pageRange.upperBound - 1)
                itemList.append(contentsOf: newItems)
            }
            footerRefreshing.toggle()
            //TODO: REMOVE EXTRA ITEMS
            if(pageRange.count > 2){
                itemList.removeSubranges(RangeSet<Int>(0..<20))
                pageRange = (pageRange.lowerBound + 1..<pageRange.upperBound)
            }
            print(itemList.count)
            print(pageRange)
        }
    }
    //TODO: ÖNCEKİ İTEMLER YÜKLENİNCE SCROLL DİREK EN ÜSTE GELİYOR O YÜZDEN HIZLICA EN BAŞTAKİ SAYFAYI ÇEKİYOR DÜZELT
    private func reload(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if(pageRange.lowerBound > 0){
                Task{
                    pageRange = (pageRange.lowerBound - 1..<pageRange.upperBound)
                    let newItems = await receiveItems(currPage: pageRange.lowerBound)
                    itemList.insert(contentsOf: newItems, at: 0)
                }
                headerRefreshing.toggle()
                //TODO: REMOVE EXTRA ITEMS
                if(pageRange.count > 2){
                    itemList.removeSubranges(RangeSet<Int>(itemList.count-20..<itemList.count))
                    pageRange = (pageRange.lowerBound..<pageRange.upperBound - 1)
                }
            }
            print(itemList.count)
            print(pageRange)
        }
    }
}

#Preview {
    CharacterListView()
}
