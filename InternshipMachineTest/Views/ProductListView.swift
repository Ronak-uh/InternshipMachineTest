import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Loading products...")
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                List(viewModel.products) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        HStack(spacing: 15) {
                            AsyncImage(url: URL(string: product.image)) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(product.title)
                                    .font(.headline)
                                    .lineLimit(2)
                                Text(product.category.capitalized)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("$\(product.price, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .bold()
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Products")
        .navigationBarBackButtonHidden(true) // Prevents going back to the login screen
        .task {
            await viewModel.loadProducts()
        }
    }
}
