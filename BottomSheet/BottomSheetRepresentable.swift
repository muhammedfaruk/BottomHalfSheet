//
//  BottomSheet.swift
//  BottomSheet
//
//  Created by Muhammed Faruk Söğüt on 12.04.2023.
//

import SwiftUI

class HalfSheetController<Content: View>: UIHostingController<Content> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let presentation = presentationController as? UISheetPresentationController {
            presentation.detents = [.medium(), .large()]
            presentation.prefersGrabberVisible = true
            presentation.largestUndimmedDetentIdentifier = .medium            
        }
    }
}


struct HalfSheet<Content: View>: UIViewControllerRepresentable {

    var content: Content
    @Binding var isPresented: Bool
    let controller = UIViewController()
    
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController:UIViewController, context: Context) {
        if isPresented {
            let sheetController = HalfSheetController(rootView: content)
            
            uiViewController.present(sheetController, animated: true) {
                DispatchQueue.main.async {
                    self.isPresented.toggle()
                }
            }
        }
        
    }
}


extension View {
    func halfSheet<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        return self
            .background{
                HalfSheet(content: content(), isPresented: isPresented)
            }
    }
}
