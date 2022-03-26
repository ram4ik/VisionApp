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
    
    var body: some View {
        List {
            ForEach(list, id: \.self) { item in
                Text(item)
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
