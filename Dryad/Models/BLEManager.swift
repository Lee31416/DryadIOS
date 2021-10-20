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
            let newPeripheral = Peripheral(index: peripherals.count, id: peripheral.identifier,name: peripheralName, rssi: RSSI.intValue)
            peripherals.append(newPeripheral)
            cbPeripherals.append(peripheral)
        }
    }
    
    func setDevice(peripheral: Peripheral) {
        print("CBPeripherals setDevice: \(cbPeripherals)")
        cbPeripherals.forEach { cbPeripheral in
            if (peripheral.id == cbPeripheral.identifier) {
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
        let service_uuid = [CBUUID.init(string: "e4b20b47-ecf2-40df-af09-e6b38c033d4d"), CBUUID.init(string: "ce2fe5e9-ad22-4671-903b-5673469eb4ce")]
        peripherals.removeAll()
        cbPeripherals.removeAll()
        myCentral.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func stopScanning() {
         myCentral.stopScan()
    }
}

struct Peripheral: Identifiable {
    let index: Int
    let id: UUID
    let name: String
    let rssi: Int
}
