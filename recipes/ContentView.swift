import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        TabView {
            VStack {
                HomeView()
            }.tabItem() {
                Label("Home", systemImage: "house")
            }.padding()
            
            VStack {
                ListView(recipes: viewModel.recipes)
            }.tabItem() {
                Label("Recipes", systemImage: "frying.pan.fill")
            }.task {
                let recipes = await loadAllRecipes()
                viewModel.useNewRecipes(recipes)
                print(recipes)
            }.badge(viewModel.recipes.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var model = Model()
    static var viewModel: ViewModel = ViewModel(model: model)
    
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}

struct HomeView: View {
    var body: some View {
        Image(systemName: "cooktop").font(.system(size: 200))
        Text("Cook Me").font(.system(size: 40))
        Text("Welcome to our cooking platform")
    }
}

struct ListView: View {
    var recipes: [Model.Recipe]
    
    var body: some View {
        NavigationStack {
            List(recipes) { recipe in
                HStack{
                    AsyncImage(url: URL(string: recipe.image)) {
                        image in image
                            .image?
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(recipe.name, value: recipe)
                }
            }
            .navigationDestination(for: Model.Recipe.self) { recipe in
                ListViewChild(recipe: recipe)
            }
        }
    }
}

struct ListViewChild: View {
    var recipe: Model.Recipe
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text(recipe.name.uppercased())
                    .font(.title2.bold())
                    .frame(alignment: .center)
                
                AsyncImage(url: URL(string: recipe.image)){
                    image in image
                        .image?
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 300)
                }
                
                VStack {
                    Text("Ingredients:")
                        .font(.title3.bold())
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                    Text(recipe.ingredients.joined(separator: ", "))
                        .fixedSize(horizontal: false, vertical: true)
                }.padding()
                
                VStack {
                    Text("Instructions:")
                        .font(.title3.bold())
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                    Text(recipe.instructions.joined(separator: ", "))
                        .fixedSize(horizontal: false, vertical: true)
                }.padding()
            }.padding()
        }.scrollBounceBehavior(.basedOnSize, axes: [.vertical])
    }
}
