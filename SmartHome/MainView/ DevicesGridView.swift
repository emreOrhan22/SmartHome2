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
        LazyVStack(spacing: 16) {
            ForEach(viewModel.devices) { device in
                DeviceCard(device: device, viewModel: viewModel)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    DevicesGridView(viewModel: HomeViewModel())
}
