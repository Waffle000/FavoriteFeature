// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI
import SwiftData
import DetailFeature
import Core

public struct FavoriteView: View {
    
    @EnvironmentObject var viewModel: FavoriteViewModel
    
    public init() {
        
    }
    
    public var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.game, id: \.id) { user in
                            NavigationLink(destination: DetailView(parameter: ConnectionStatus.offline, id: user.id, name: user.name)) {
                                FavoriteListView(name: user.name , date: user.released , image: user.background_image ?? "", rating: user.rating , maxRating: user.rating_top )
                            }
                        }.padding()
                    }
                }
            }
        }.navigationTitle("Favorite").onAppear {
            viewModel.loadGamesLocal()
        }
    }
}
