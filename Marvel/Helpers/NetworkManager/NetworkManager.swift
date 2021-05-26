//
//  NetworkManager.swift
//
//  Created by Alfonso Miranda on 26/05/2021.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let reachabilityManager =  try? Reachability()
    
    func startNetworkReachabilityObserver() {
        reachabilityManager?.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        reachabilityManager?.whenUnreachable = { _ in
            print("Not reachable")
        }

        do {
            try reachabilityManager?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    func checkNetwork() -> Bool {
        return self.reachabilityManager?.connection != .unavailable
    }
}
