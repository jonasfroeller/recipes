import Foundation

let API_URL = URL(string: "https://edufs.edu.htl-leonding.ac.at/~c.aberger/download/recipes/recipes.json")!

func loadAllRecipes() async -> [Model.Recipe] {
    var recipes = [Model.Recipe]()
    
    if let (data, _) = try? await URLSession.shared.data(from: API_URL) {
        if let fetched = try? JSONDecoder().decode(Model.Recipes.self, from: data) {
            print(fetched)
            recipes = fetched.recipes
        } else {
            print("najo, des woa nix")
        }
    } else {
        print("schade")
    }
    
    return recipes
}
