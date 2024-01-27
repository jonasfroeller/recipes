import Foundation

struct Model {
    struct Recipes: Codable, Hashable {
        var recipes: [Recipe]
    }
    
    struct Recipe: Codable, Identifiable, Hashable {
        var id: Int
        var name: String
        var ingredients: [String]
        var instructions: [String]
        var prepTimeMinutes: Int
        var cookTimeMinutes: Int
        var servings: Int
        var difficulty: String
        var cuisine: String
        var caloriesPerServing: Int
        var tags: [String]
        var userId: Int
        var image: String
        var rating: Double
        var reviewCount: Int
        var mealType: [String]
    }
    
    var recipes = [Recipe]()
    
    mutating func updateRecipes(recipes: [Recipe]) {
        self.recipes = recipes
    }
}

/* EXAMPLE OBJECT:
   "id": 1,
   "name": "Classic Margherita Pizza",
   "ingredients": [
       "Pizza dough",
       "Tomato sauce",
       "Fresh mozzarella cheese",
       "Fresh basil leaves",
       "Olive oil",
       "Salt and pepper to taste"
   ],
   "instructions": [
       "Preheat the oven to 475Â°F (245Â°C).",
       "Roll out the pizza dough and spread tomato sauce evenly.",
       "Top with slices of fresh mozzarella and fresh basil leaves.",
       "Drizzle with olive oil and season with salt and pepper.",
       "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
       "Slice and serve hot."
   ],
   "prepTimeMinutes": 20,
   "cookTimeMinutes": 15,
   "servings": 4,
   "difficulty": "Easy",
   "cuisine": "Italian",
   "caloriesPerServing": 300,
   "tags": [
       "Pizza",
       "Italian"
   ],
   "userId": 45,
   "image": "https://cdn.dummyjson.com/recipe-images/1.webp",
   "rating": 4.6,
   "reviewCount": 3,
   "mealType": [
       "Dinner"
   ]
*/
