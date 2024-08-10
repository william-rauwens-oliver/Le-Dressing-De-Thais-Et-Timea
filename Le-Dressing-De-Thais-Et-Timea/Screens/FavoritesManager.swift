import Foundation

class FavoritesManager {
    static let shared = FavoritesManager()
    private let defaults = UserDefaults.standard
    private let favoritesKey = "favoriteItems"
    
    func saveFavoriteItems(_ items: [FavoriteItem]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            defaults.set(encoded, forKey: favoritesKey)
        }
    }
    
    func loadFavoriteItems() -> [FavoriteItem] {
        if let savedItems = defaults.data(forKey: favoritesKey) {
            let decoder = JSONDecoder()
            if let loadedItems = try? decoder.decode([FavoriteItem].self, from: savedItems) {
                return loadedItems
            }
        }
        return []
    }
}
