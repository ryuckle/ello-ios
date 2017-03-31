////
///  FileManagerExtensions.swift
//

extension FileManager {

    class func ElloDocumentsDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
}
