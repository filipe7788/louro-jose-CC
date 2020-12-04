//
//  Home.swift
//  louro-jose
//
//  Created by Filipe Cruz on 04/12/20.
//

import SwiftUI

struct Home: View {
    @State var selected : Int = 0
    @State private var isSharedSheetShowing = false
    @State var itens: [Any] = []
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height

    var body: some View {
        TabView(selection: $selected) {
            
            ForEach(1...7, id: \.self) { index in
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                    
                    GeometryReader { geometry in
                        
                        Image("louro\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x: -geometry.frame(in: .global).minX)
                            .frame(width: width, height: height/2)

                    }
                    .frame(height: height/2)
                    .cornerRadius(15)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: Color/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: -5, y: -5)
                    
                    
                    Button(action: {
                        itens.append(UIImage(named: "louro\(index)"))
                        isSharedSheetShowing.toggle()
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.largeTitle)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                    })
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5 )
                    .background(Color.white)
                    .clipShape(Circle())
                })
                .padding(.horizontal, 25)
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        .sheet(isPresented: $isSharedSheetShowing) {
            ShareSheet(itens: [])
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var itens: [Any]
    
    func makeUIViewController(context: Context) ->  UIActivityViewController {
        let controller = UIActivityViewController(activityItems: itens, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
