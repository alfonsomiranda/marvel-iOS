//
//  NetworkManager.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

class NetworkManager {
    
    //shared instance
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
