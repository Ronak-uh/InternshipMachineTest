import Foundation

enum NetworkError: Error {
    case invalidURL
    case networkFailure
    case invalidData
}

class NetworkService {
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { throw NetworkError.invalidURL }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.networkFailure
            }
            return try JSONDecoder().decode([Product].self, from: data)
        } catch {
            throw NetworkError.networkFailure
        }
    }
}
