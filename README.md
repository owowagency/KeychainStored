# 🔑 KeychainStored

A simple Swift property wrapper for storing data in the keychain. It supports:

- All types that are `Codable`.
- iOS 8+, watchOS 2+, macOS 10.10+, and tvOS 9+.

### 👶 Usage

Declare a property in one of your types:

```swift
@KeychainStored(service: "com.example.my-service") var myString: String
```

Then just use it like any other property:

```swift
// To delete
myString = nil

// To set
myString = "Some value"

// To get
if let myString = myString {
    // 🚀
}
```

Note that wrapped values are always accessed as optionals.


That's all there is to it!

### 💼 Custom encoder / decoder

By default, the property wrapper will use a `JSONEncoder()` and `JSONDecoder()` to encode values, but you can use a custom encoder and/or decoder.

The coders must implement the `TopLevelEncoder` and `TopLevelDecoder` protocols, where the input and output types are required to be `Data`. `JSONEncoder`, `JSONDecoder`, `PropertyListEncoder`, and `PropertyListDecoder` work out of the box.

Note that the coders are not used if the type of the wrapped value is `String`. Strings are always stored directly with UTF-8 encoding.

To use your custom coders:

```swift
@KeychainStored(service: "...", encoder: PropertyListEncoder(), decoder: PropertyListDecoder()) var myVar: MyStruct
```

### 🌳 Logging

By default, errors are logged using `print`. The initialiser of the `@KeychainStored` property wrapper accepts a `logger` closure that you can use to customise logging behaviour.
