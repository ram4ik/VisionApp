//
//  ContentView.swift
//  VisionApp
//
//  Created by ramil on 26.03.2022.
//

import SwiftUI
import Vision
import VisionAppSDK

struct ContentView: View {
    
    let documetsNameList = ["1", "2", "3", "4", "5", "6", "7"]
    
    let sdk = VisionSDK()
    
    var body: some View {
        Text("Hello, world!")
            .onAppear {
                for document in documetsNameList {
                    peformTextRecognitionRequest(imageName: document)
                }
                sdk.getRecognizedText()
            }
    }
    
    func peformTextRecognitionRequest(imageName: String) {
        
        // Get the CGImage on which to perform requests.
        guard let cgImage = UIImage(named: imageName)?.cgImage else { return }
        
        // Create a new image-request handler.
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        
        // Create a new request to recognize text.
        let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)
        
        do {
            // Perform the text-recognition request.
            try requestHandler.perform([request])
        } catch {
            print("Unable to perform the requests: \(error).")
        }
    }
    
    func recognizeTextHandler(request: VNRequest, error: Error?) {
        guard let observations =
                request.results as? [VNRecognizedTextObservation] else {
                    return
                }
        let recognizedStrings = observations.compactMap { observation in
            // Return the string of the top VNRecognizedText instance.
            return observation.topCandidates(1).first?.string
        }
        
        print("Recognized text: \(recognizedStrings)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
