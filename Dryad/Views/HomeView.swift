import SwiftUI

struct HomeView: View {
    @ObservedObject var bleManager = BLEManager()
    @State var connectedDevice: String = "None"
    
    var body: some View {
        
        
        VStack (spacing: 10) {
            Text("Bluetooth Devices")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .center)
 
            PeripheralList(bleManager: self.bleManager ,peripherals: bleManager.peripherals)    

            Spacer()

            Text("STATUS")
                .font(.headline)

            BluetoothToggler(bleState: bleManager.bleState)
            
            ConnectedDevice(connectedDevice: bleManager.connectedDevice)

            Button(action: {
                bleManager.disconnectFromDevice()
            }) {
                Text("Disconnect")
            }
            
            Spacer()

            HStack {
                VStack (spacing: 10) {
                    BLEScanButtons(bleManager: self.bleManager)
                        .padding()

                    Spacer()

//                    VStack (spacing: 10) {
//                        Button(action: {
//                            print("Start Advertising")
//                        }) {
//                            Text("Start Advertising")
//                        }
//                        Button(action: {
//                            print("Stop Advertising")
//                        }) {
//                            Text("Stop Advertising")
//                        }
//                    }.padding()
                }
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ConnectedDevice : View {
    var connectedDevice: String
    
    var body: some View {
        Text(connectedDevice)
    }
}

struct BluetoothToggler : View {
    var bleState: String

    var body: some View {
        Text(bleState)
    }
}

struct PeripheralList: View {
    var bleManager: BLEManager
    var peripherals: [Peripheral]
    
    var body: some View {
        return List(bleManager.peripherals) { peripheral in
            HStack {
                Text(peripheral.name)
                Spacer()
                Text(String(peripheral.id))
                Spacer()
                Button(action: {






                    bleManager.setDevice(peripheral: peripheral)
                    bleManager.connectToDevice()
                }) {
                    Text("Connect")
                }
            }
        }.frame(height: 300)
    }
}

struct BLEScanButtons: View {
    var bleManager: BLEManager
    
    var body: some View {
        Button(action: {
            self.bleManager.startScanning()
        }) {
            Text("Start Scanning")
        }
        Button(action: {
            self.bleManager.stopScanning()
        }) {
            Text("Stop Scanning")
        }
    }
}
