//
//  EditView.swift
//  PhotoEditorApp
//
//  Created by Atsuki Jako on 2024-02-18.
//

import SwiftUI

struct EditorView: View {
    @EnvironmentObject var environment: HomeViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                if !environment.editorModel.isEmpty && environment.mainImage != nil{
                    Image(uiImage: environment.mainImage.image)
                        .resizable()
                        .frame(width: Constants.Frame.widthL, height: Constants.Frame.heightL)
                        .cornerRadius(Constants.Design.radiusL)
                        .shadow(color: .black, radius: Constants.Design.radiusS)
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(environment.editorModel) { filter in
                                ZStack {
                                    Image(uiImage: filter.image)
                                        .resizable()
                                        .frame(width: Constants.Frame.widthS, height: Constants.Frame.heightS)
                                        .cornerRadius(Constants.Design.radiusL)
                                        .opacity(0.5)
                                    Text(filter.filterName)
                                        .font(.system(size: Constants.Font.sizeS, weight: .bold, design: .rounded))
                                        .shadow(color: .white, radius: Constants.Design.radiusS)
                                }
                                .onTapGesture {
                                    environment.mainImage = filter
                                }
                            }
                        }
                    }
                    .padding()
                }else {
                    ProgressView(Constants.Text.loading)
                        .controlSize(.large)
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        environment.saveButton.toggle()
                    }label: {
                        Text(Constants.Text.saveButton)
                    }
                    .font(.title2)
                    .foregroundColor(.black)
                    .disabled(environment.mainImage == nil ? true : false)
                    .alert(isPresented: $environment.saveButton) {
                        Alert(
                            title: Text(Constants.Text.alertTitle),
                            message: Text(Constants.Text.alertMessage),
                            primaryButton: .destructive(Text(Constants.Text.yes), action: {
                                environment.isSelected.toggle()
                                dismiss()
                                UIImageWriteToSavedPhotosAlbum(environment.mainImage.image, nil, nil, nil)
                            }),
                            secondaryButton: .default(Text(Constants.Text.no))
                        )
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        environment.isSelected.toggle()
                        dismiss()
                    }label: {
                        Text(Constants.Text.cancelButton)
                    }
                    .font(.title2)
                    .foregroundColor(.black)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.mint,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
        .navigationTitle(Constants.Title.titleEditor)
    }
}

#Preview {
    EditorView()
        .environmentObject(HomeViewModel())
}
