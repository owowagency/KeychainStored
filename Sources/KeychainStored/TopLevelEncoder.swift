import Foundation

public protocol TopLevelEncoder {
    associatedtype Output

    func encode<T>(_ value: T) throws -> Self.Output where T : Encodable
}

extension JSONEncoder: TopLevelEncoder {}
extension PropertyListEncoder: TopLevelEncoder {}
