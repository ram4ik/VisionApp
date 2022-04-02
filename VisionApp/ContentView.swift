//
//  ContentView.swift
//  VisionApp
//
//  Created by ramil on 26.03.2022.
//

import SwiftUI
import VisionAppSDK

struct ContentView: View {
    
    let sdk = VisionSDK()
    
    @State var list = [String]()
    
    @State var image: Image? = nil
    @State var uiimage: UIImage? = nil
    @State var showingImagePicker = false
    
    var body: some View {
        ZStack {
            if (list.isEmpty) {
                VStack {
                    Text("Happy path doesn't happen, please try again")
                }
            } else {
                List {
                    ForEach(list, id: \.self) { item in
                        Text(item)
                    }
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        self.showingImagePicker.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(15)
                            .padding()
                    }.sheet(isPresented: $showingImagePicker, content: {
                        ImagePicker.shared.view
                    }).onReceive(ImagePicker.shared.$uiimage) {
                        uiimage in self.uiimage = uiimage
                        if let uiimage = uiimage {
                            list = sdk.getListOfRecognizedText(image: uiimage)
                        }
                    }

                }
            }
        }
        .onAppear {
            list = sdk.getListOfRecognizedText(image: UIImage(named: "1")!)
            
            sdk.getRecognizedText(image: UIImage(named: "1")!)
            
            sdk.getRecognizedHuman(image: UIImage(named: "1")!)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
