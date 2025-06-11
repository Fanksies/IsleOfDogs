//
//  DogView.swift
//  IloveDogs
//
//  Created by Arturo Ruiz on 10/06/25.
//

import SDWebImageSwiftUI
import SwiftUI

struct DogView: View {
    @StateObject private var viewModel = DogViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.dogs) { doggo in
                        HStack(alignment: .bottom, spacing: 0) {
                            WebImage(url: doggo.image)
                                .resizable()
                                .indicator(.activity)
                                .transition(.fade(duration: 0.5))
                                .scaledToFill()
                                .frame(width: 120, height: 180)
                                .clipped()
                                .cornerRadius(12)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(doggo.dogName)
                                    .font(.headline)
                                Text(doggo.description)
                                    .font(.subheadline)
                                    .lineLimit(3)
                                    .padding(.vertical, 10)
                                // TODO: Validate
                                Text("Almost \(doggo.age) years")
                                    .font(.caption)
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .frame(width: 250,
                                   height: 160,
                                   alignment: .leading,
                            )
                            .background(Color.white)
                            .cornerRadius(5)
                            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical, 15)
            .background(Color(.systemGray6))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Dogs We Love")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Dogs We Love")
                        .font(.system(size: 30))
                }
            }
            .task {
                await viewModel.load()
            }
        }
    }
}

#Preview {
    DogView()
}
