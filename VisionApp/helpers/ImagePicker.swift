//
//  ImagePicker.swift
//  VisionApp
//
//  Created by ramil on 02.04.2022.
//

import SwiftUI
import Combine
import Foundation

class ImagePicker: ObservableObject {
    static let shared: ImagePicker = ImagePicker()
    private init(){}
    let view = ImagePicker.View()
    let coordinator = ImagePicker.Coordinator()
    
    let willChange = PassthroughSubject<Image?, Never>()
    @Published var image:Image? = nil {
        didSet {
            if image != nil {
                willChange.send(image)
            }
        }
    }
    @Published var uiimage: UIImage? = nil
}

extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            ImagePicker.shared.uiimage = image
            ImagePicker.shared.image = Image(uiImage: image)
            picker.dismiss(animated: true)
        }
    }
}

extension ImagePicker {
    struct View: UIViewControllerRepresentable {
        func makeCoordinator() -> Coordinator {
            return ImagePicker.shared.coordinator
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker.View>) -> UIImagePickerController {
            let imagePIckerController = UIImagePickerController()
            imagePIckerController.delegate = context.coordinator
            return imagePIckerController
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker.View>) {
            
        }
    }
}

