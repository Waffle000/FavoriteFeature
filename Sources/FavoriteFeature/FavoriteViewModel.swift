//
//  File.swift
//  
//
//  Created by Enrico Maricar on 28/05/24.
//

import Foundation
import RxSwift
import Core

public class FavoriteViewModel : ObservableObject {
    @Published var game : [GameDetail] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private let disposeBag: DisposeBag = DisposeBag()
    private final let appRepository : AppRepository
    public init(appRepository : AppRepository) {
        self.appRepository = appRepository
    }
    
    public func loadGamesLocal() {
        isLoading = true
        appRepository.fetchGamesLocal()
            .subscribe(
                onNext: { [weak self] items in
                    self?.game = items
                    self?.isLoading = false
                },
                onError: { [weak self] error in
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                },
                onCompleted: { [weak self] in
                    self?.isLoading = false
                }
            ).disposed(by: disposeBag)
    }
}
