//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by Marble Interactive SL on 15/1/23.
//

import SwiftUI
import Combine

struct SettingView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var settingStore: SettingStore
    
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { orderType in
                            Text(orderType.text)
                        }
                    } label: {
                        Text("Display Order")
                    }

                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Show Check-in Only")
                    }
                    Stepper {
                        self.maxPriceLevel += 1
                        
                        if self.maxPriceLevel > 5 {
                            self.maxPriceLevel = 5
                        }
                    } onDecrement: {
                        self.maxPriceLevel -= 1
                        if self.maxPriceLevel < 1 {
                            self.maxPriceLevel = 1
                        }
                    } label: {
                        Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                    }

                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.callout)
                            .foregroundColor(.black)
                    }

                })
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.settingStore.showCheckInOnly = self.showCheckInOnly
                        self.settingStore.displayOrder = self.selectedOrder
                        self.settingStore.maxPriceLevel = self.maxPriceLevel
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.callout)
                            .foregroundColor(.black)
                    }

                }
            }
        }
        .onAppear {
            self.selectedOrder = self.settingStore.displayOrder
            self.showCheckInOnly = self.settingStore.showCheckInOnly
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(SettingStore())
    }
}
