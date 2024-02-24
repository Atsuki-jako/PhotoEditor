//
//  Constants.swift
//  PhotoEditorApp
//
//  Created by Atsuki Jako on 2024-02-19.
//

import Foundation
import SwiftUI

struct Constants {
    struct Title {
        static let titleHome = "Photo Editor"
        static let titleEditor = "Editor"
    }
    
    struct Text {
        static let loading = "Loading"
        static let saveButton = "Save"
        static let cancelButton = "Cancel"
        static let alertTitle = "Do you want to save this image?"
        static let alertMessage = "You will go back to the Home."
        static let yes = "Yes"
        static let no = "No"
    }
    
    struct ImageIcon {
        static let photo = "photo.badge.plus"
    }
    
    struct Frame {
        static let widthS: CGFloat = 140
        static let widthL: CGFloat = 350
        
        static let heightS: CGFloat = 140
        static let heightL: CGFloat = 350
    }
    
    struct Design {
        static let radiusS: CGFloat = 4
        static let radiusL: CGFloat = 17
    }
    
    struct Font {
        static let sizeS: CGFloat = 27
    }
}
