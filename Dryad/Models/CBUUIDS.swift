import Foundation
import CoreBluetooth

struct CBUUIDS {

    static let kBLEService_UUID = "e4b20b47-ecf2-40df-af09-e6b38c033d4d"
    static let kBLE_Characteristic_uuid = "ce2fe5e9-ad22-4671-903b-5673469eb4ce"
//    static let kBLE_Characteristic_uuid_Rx = "6e400003-b5a3-f393-e0a9-e50e24dcca9e"
//    static let MaxCharacters = 20
//
    static let BLEService_UUID = CBUUID(string: kBLEService_UUID)
    static let BLE_Characteristic_uuid = CBUUID(string: kBLE_Characteristic_uuid)// (Property = Read/Notify)

}
