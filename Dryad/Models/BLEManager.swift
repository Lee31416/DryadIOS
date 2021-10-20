import Foundation
import CoreBluetooth
import SwiftUI

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    @Published var isSwitchedOn = false
    @Published var peripherals = [Peripheral]()
    @Published var cbPeripherals = [CBPeripheral]()
    @Published var connectedDevice = "None"
    @Published var bleState = "BLE Off"
    var myCentral: CBCentralManager!
    var myPeripheral: CBPeripheral!
    
    override init() {
        super.init()
        
        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
    }

    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            isSwitchedOn = true
            bleState = "BLE On"
            startScanning()
        }
        else {
            isSwitchedOn = false
            bleState = "BLE Off"
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var peripheralName: String!

       
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
            let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
            peripherals.append(newPeripheral)
            cbPeripherals.append(peripheral)
        }
    }
    
    func setDevice(peripheral: Peripheral) {
        print("CBPeripherals setDevice: \(cbPeripherals)")
        cbPeripherals.forEach { cbPeripheral in
            if (peripheral.name == cbPeripheral.name) {
                myPeripheral = cbPeripheral
            }
        }
    }
    
    func connectToDevice() -> Void {
        myCentral.connect(myPeripheral)
        connectedDevice = myPeripheral.name!
        stopScanning()
    }
    
    func disconnectFromDevice() -> Void {
        if myPeripheral != nil {
            myCentral.cancelPeripheralConnection(myPeripheral!)
        }
        connectedDevice = "None"
        startScanning()
    }
    
    func startScanning() {
        var services = [[CBUUID UUIDWithString: @"2456e1b9-26e2-8f83-e744-f34f01e9d701"] ]; // change to your service UUID!
        NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:CBCentralManagerScanOptionAllowDuplicatesKey];

        peripherals.removeAll()
        cbPeripherals.removeAll()
        myCentral.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func stopScanning() {
         myCentral.stopScan()
    }
}

struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}
