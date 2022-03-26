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
    
    var body: some View {
        Text("Hello, world!")
            .onAppear {
                sdk.getRecognizedText(image: UIImage(named: "1")!)
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
