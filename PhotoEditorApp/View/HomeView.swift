//
//  HomeView.swift
//  PhotoEditorApp
//
//  Created by Atsuki Jako on 2024-02-18.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isSelected {
                    EditorView()
                        .environmentObject(viewModel)
                }
            }
            .onChange(of: viewModel.isSelected) {
                viewModel.editorModel.removeAll()
                viewModel.mainImage = nil
                viewModel.loadFilter()
            }
            .navigationTitle(Constants.Title.titleHome)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showPickerView.toggle()
                    }label: {
                        Image(systemName: Constants.ImageIcon.photo)
                            .font(.title)
                            .symbolRenderingMode(.multicolor)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showPickerView) {
                ImagePicker(imageData: $viewModel.selectedImage, isSelected: $viewModel.isSelected)
                    .environmentObject(viewModel)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [.mint,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
            
        }
    }
}

#Preview {
    HomeView()
}
