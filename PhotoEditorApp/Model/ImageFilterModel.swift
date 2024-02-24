//
//  ImageFilterModel.swift
//  PhotoEditorApp
//
//  Created by Atsuki Jako on 2024-02-18.
//

import Foundation
import SwiftUI

struct ImageFilterModel: Identifiable{
    var id = UUID()
    var image: UIImage
    var filter: CIFilter
    var filterName: String
    
    static let filterData: [(CIFilter, String)] = [
        (CIFilter.comicEffect(), "Comic"),
        (CIFilter.colorPosterize(), "Posterize"),
        (CIFilter.sRGBToneCurveToLinear(), "sRGB"),
        (CIFilter.falseColor(), "False"),
        (CIFilter.discBlur(), "Blur"),
        (CIFilter.photoEffectMono(), "Mono"),
    ]
    
    init(image: UIImage, filter: CIFilter, filterName: String) {
        self.image = image
        self.filter = filter
        self.filterName = filterName
    }
    
    init() {
        self.image = UIImage(systemName: "figure")!
        self.filter = CIFilter()
        self.filterName = "Mono"
    }
}
