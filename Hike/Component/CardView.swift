//
//  CardView.swift
//  Hike
//
//  Created by ธนพงษ์ แจ้งสว่าง on 10/12/2566 BE.
//

import SwiftUI

struct CardView: View {

    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage(){
        print("---BUTTON WAS PRESSED ---")
        print("Status: Old Image Number = \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        
        print("Result: New Image Number = \(imageNumber)")
        print("--- THE END ---")
        print("\n")
    }
    
    var body: some View {
        
        ZStack {
            CustomBackgroundView()
            
            VStack {
            
                VStack (alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        Spacer()
                        
                        Button{
                          
                            print("The button was pressed.")
                            isShowingSheet.toggle()
                        }label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                
                ZStack {
                   CustomCircleView()
                   
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                Button{
                   
                    randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButtonStyle())
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}