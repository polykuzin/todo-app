//
//  AddView.swift
//  todo-app
//
//  Created by polykuzin on 26/08/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode)
    var presentationMode
    @EnvironmentObject
    var listViewModel: SummaryViewModel
    @State
    var textFieldText: String = ""
    
    @State
    var alertTitle = ""
    
    @State
    var showAlert = false
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image(systemName: "arrow.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.appColor)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("type here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
            }
//            .frame(maxHeight: .infinity)
            .padding(14)
        }
        .navigationTitle("Add an Item")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .alert(isPresented: $showAlert, content: getAlert)
        .overlay(Button(action: saveButtonPressed, label: {
            Text("Save".uppercased())
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(10)
                .padding()
        }), alignment: .bottom)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(SummaryViewModel())
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(SummaryViewModel())
            
        }
        .previewDevice("iPhone 13 Pro Max")

    }
}
