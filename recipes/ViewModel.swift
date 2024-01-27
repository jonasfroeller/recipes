import Foundation

class ViewModel: ObservableObject {
    @Published private var model: Model
    
    var recipes: [Model.Recipe] {
        model.recipes
    }
    
    init(model: Model) {
        self.model = model
    }
    
    func useNewRecipes(_ recipes: [Model.Recipe]) {
        model.updateRecipes(recipes: recipes)
    }
}
