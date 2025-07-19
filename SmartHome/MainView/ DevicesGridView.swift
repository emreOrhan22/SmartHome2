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
            ForEach(viewModel.deviceLogs) { log in
                VStack(alignment: .leading) {
                    Text(log.type)
                        .font(.headline)
                    Text("Room: \(log.area.capitalized)")
                    Text("Situation: \(log.state.capitalized) • Value: \(log.value)")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
        }
        .padding()
    }
}


#Preview {
    DevicesGridView(viewModel: HomeViewModel())
}
