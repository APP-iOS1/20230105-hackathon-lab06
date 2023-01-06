//
//  WebViewModel.swift
//  Check_It
//
//  Created by sole on 2023/01/05.
//

import Foundation
import Combine

@MainActor
class WebViewModel: ObservableObject {
    var foo = PassthroughSubject<Bool, Never>()
    var bar = PassthroughSubject<Bool, Never>()
    @Published var result: String?
}
