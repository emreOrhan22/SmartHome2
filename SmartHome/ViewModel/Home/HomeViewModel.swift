import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var deviceLogs: [DeviceLog] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    @AppStorage("token") private var token: String = ""

    func fetchDeviceLogs() async {
        isLoading = true
        errorMessage = nil

        do {
            let logs = try await APIService.getDeviceLogs(token: token)
            self.deviceLogs = logs
        } catch {
            errorMessage = "Veriler alınamadı: \(error.localizedDescription)"
        }

        isLoading = false
    }
}

extension HomeViewModel {
    var groupedLogsByRoom: [String: [DeviceLog]] {
        Dictionary(grouping: deviceLogs) { log in
            log.area
        }
    }
}
