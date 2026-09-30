import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                
                Text(product.title)
                    .font(.title2)
                    .bold()
                
                HStack {
                    Text(product.category.capitalized)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.title)
                        .bold()
                }
                
                if let rating = product.rating {
                    Text("Rating: \(rating.rate, specifier: "%.1f") (\(rating.count) reviews)")
                        .font(.subheadline)
                        .foregroundColor(.orange)
                }
                
                Divider()
                
                Text("Description")
                    .font(.headline)
                Text(product.description)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

