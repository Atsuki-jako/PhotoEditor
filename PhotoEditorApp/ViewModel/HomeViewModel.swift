//
//  HomeViewModel.swift
//  PhotoEditorApp
//
//  Created by Atsuki Jako on 2024-02-18.
//

import Foundation
import SwiftUI
import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

class HomeViewModel: ObservableObject {
    @Published var showPickerView: Bool = false
    @Published var selectedImage = UIImage()
    @Published var editorModel: [ImageFilterModel] = []
    @Published var mainImage: ImageFilterModel!
    @Published var isSelected: Bool = false
    @Published var saveButton: Bool = false
    
    func loadFilter() {
        let context = CIContext()
        let originalData = ImageFilterModel(image: self.selectedImage, filter: CIFilter(), filterName: "Original")
        self.editorModel.append(originalData)
        
        DispatchQueue.global(qos: .userInteractive).async {
            for (filter, filterName) in ImageFilterModel.filterData {
                let ciImage = CIImage(image: self.selectedImage)
                filter.setValue(ciImage, forKey: kCIInputImageKey)
                
                guard let newImage = filter.outputImage else {return}
                
                let cgImage = context.createCGImage(newImage, from: newImage.extent)
                let filteredData = ImageFilterModel(image: UIImage(cgImage: cgImage!), filter: filter, filterName: filterName)
                
                DispatchQueue.main.async {
                    self.editorModel.append(filteredData)
                    if self.mainImage == nil{
                        self.mainImage = originalData
                    }
                }
            }
        }
    }
}
