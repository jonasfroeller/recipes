import SwiftUI

fileprivate let model = Model()

@main
struct TestZweiApp: App {
    var viewModel = ViewModel(model: model)
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
