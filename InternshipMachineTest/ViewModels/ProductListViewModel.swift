import Foundation
import Combine

@MainActor
class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let networkService = NetworkService()
    
    func loadProducts() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedProducts = try await networkService.fetchProducts()
            if fetchedProducts.isEmpty {
                errorMessage = "No products available."
            } else {
                self.products = fetchedProducts
            }
        } catch {
            errorMessage = "Unable to connect to the server.\nPlease check your internet connection and try again."
        }
        
        isLoading = false
    }
}
