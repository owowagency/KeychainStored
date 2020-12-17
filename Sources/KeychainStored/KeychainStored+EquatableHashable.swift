extension KeychainStored: Equatable where Value: Equatable {
    public static func == (lhs: KeychainStored<Value, ValueEncoder, ValueDecoder>, rhs: KeychainStored<Value, ValueEncoder, ValueDecoder>) -> Bool {
        lhs.service == rhs.service && lhs.wrappedValue == rhs.wrappedValue
    }
}

extension KeychainStored: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        service.hash(into: &hasher)
        wrappedValue?.hash(into: &hasher)
    }
}
