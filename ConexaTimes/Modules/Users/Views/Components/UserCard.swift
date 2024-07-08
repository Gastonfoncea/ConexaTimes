//
//  UserCard.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import SwiftUI

struct UserCard: View {
    
    var firstName: String
    var lastName: String
    var city: String
    var street: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.gray.opacity(0.1))
            
            HStack(spacing:15) {
                Image("ConexaCircle")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(height: 45)
                VStack(alignment:.leading,spacing:15) {
                    HStack {
                        Text(firstName)
                            .font(.subheadline)
                        Text(lastName)
                            .font(.subheadline)
                    }
            
                    HStack {
                        Text(city)
                            .font(.footnote)
                            .bold()
                        Text(street)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }
                Spacer()
                ButtonGoogleMaps()
                    .padding(.trailing)
            }
            .padding(.leading)
        }
        .frame(height: 75)
    }
}

#Preview {
    UserCard(firstName: "Bronny", lastName: "James", city: "Los Angeles", street: "St. Califonia 1453")
}
