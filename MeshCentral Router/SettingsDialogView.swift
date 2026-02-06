//
//  SettingsDialogView.swift
//  MeshCentral Router
//
//  Created by Default on 12/23/20.
//

import SwiftUI

struct SettingsDialogView: View {
    var devicesView:DevicesView?
    @State var showOnlyOnlineDevices:Bool = false
    @State var bindLoopbackOnly:Bool = false
    
    init (devicesView:DevicesView?) {
        self.devicesView = devicesView
        _showOnlyOnlineDevices = State(initialValue: globalShowOnlyOnlineDevices)
        _bindLoopbackOnly = State(initialValue: globalBindLoopbackOnly)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Display Options")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Toggle(isOn: $showOnlyOnlineDevices) { 
                    Text("Show only online devices") 
                }
                //Toggle(isOn: $bindLoopbackOnly) { Text("Bind only to loopback interface") }
            }.padding()
            HStack(spacing: 10) {
                Button("OK") {
                    changeSettings(showOnlyOnlineDevices:showOnlyOnlineDevices, bindLoopbackOnly:bindLoopbackOnly)
                    devicesView?.showSettingsModal = false
                }
                .buttonStyle(BorderedButtonStyle())
                Button("Cancel") {
                    devicesView?.showSettingsModal = false
                }
                .buttonStyle(BorderedButtonStyle())
            }.padding([.horizontal, .bottom])
        }.background(Color("MainBackground")).foregroundColor(Color("MainTextColor")).shadow(radius: 20)
    }
}

struct SettingsDialogView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsDialogView(devicesView:nil)
    }
}
