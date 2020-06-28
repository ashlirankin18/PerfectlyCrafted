//
//  DetailedView.swift
//  PerfectlyCrafted
//
//  Created by Ashli Rankin on 6/27/20.
//  Copyright © 2020 Ashli Rankin. All rights reserved.
//

import SwiftUI

struct DetailedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var product: Product
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Page(image: unwrapImages())
                        .edgesIgnoringSafeArea(.top)
                    ButtonView()
                }
                VStack(alignment: .leading, spacing: 30) {
                    Text(product.name?.capitalized ?? "")
                        .font(.custom("Avenir Next Bold", size: 30.0))
                        .multilineTextAlignment(.center)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Product Description")
                                .font(.custom("Avenir Next Bold", size: 19.0))
                            Spacer(minLength: 20)
                            Text(product.productDescription ?? "")
                                .font(.custom("Avenir Next Medium", size: 17.0))
                        }
                        Spacer()
                    }
                    Text("I thought...")
                        .font(.custom("Avenir Next Bold", size: 17.0))
                    Text(product.experience ?? "")
                        .font(.custom("Avenir Next Medium", size: 17.0))
                    Text("ProductCategory")
                        .font(.custom("Avenir Next Bold", size: 17.0))
                    Text(product.category ?? "")
                        .font(.custom("Avenir Next Medium", size: 17.0))
                    Text("IsComplete")
                        .font(.custom("Avenir Next Bold", size: 17.0))
                    if product.isfinished {
                        Text("Complete")
                            .font(.custom("Avenir Next Medium", size: 17.0))
                    } else {
                        Text("Stille In Use")
                            .font(.custom("Avenir Next Medium", size: 17.0))
                    }
                }
                .padding(20.0)
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        }
        .navigationBarItems(leading:
                                HStack {
                                    RoundButton(imageName: "chevron.left") {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                })
        .navigationBarBackButtonHidden(true)
    }
    
    private func unwrapImages() -> UIImage {
        guard let images = product.images as? Set<Image>, !images.isEmpty, let image = images.first, let data = image.imageData  else {
            return UIImage(named: "placeholder") ?? UIImage()
        }
        
        guard let unwrappedImage = UIImage(data: data) else {
            return UIImage(named: "placeholder") ?? UIImage()
        }
        return unwrappedImage
    }
}

struct ButtonView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                VStack(alignment: .trailing, spacing: 25.0) {
                    RoundButton(imageName: "pencil") {
                    }
                    
                    RoundButton(imageName: "trash.fill") {
                    }
                    RoundButton(imageName: "square.and.arrow.up") {
                    }
                }
            }.padding(20.0)
            Spacer()
        }
        .padding(.top, 30.0)
    }
}

struct RoundButton: View {
    
    private let imageName: String
    
    var action: () -> Void
    
    init(imageName: String, action: @escaping () -> Void) {
        self.imageName = imageName
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            SwiftUI.Image(systemName: imageName)
                .padding()
                .frame(width: 36.0)
                .background(Color.white)
                .clipShape(Circle())
                .font(.system(size: 20.0, weight: .medium))
                .foregroundColor(.black)
        })
    }
}