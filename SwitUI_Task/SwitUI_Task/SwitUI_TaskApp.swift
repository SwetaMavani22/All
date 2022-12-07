//
//  SwitUI_TaskApp.swift
//  SwitUI_Task
//
//  Created by Mavani on 22/11/22.
//

import SwiftUI

@main
struct SwitUI_TaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            BitCoinVC()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
