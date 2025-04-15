//
//   DevicesGridView.swift
//  SmartHome
//
//  Created by Emre on 21.03.2025.
//

import SwiftUI

struct DevicesGridView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.devices) { device in
                DeviceCard(device: device, viewModel: viewModel)
            }
        }
    }
}

#Preview {
    DevicesGridView(viewModel: HomeViewModel())
}
