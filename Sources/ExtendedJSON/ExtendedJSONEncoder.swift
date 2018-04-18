import Foundation
import BSON

/// An object that encodes instances of `Encodable` types as ExtendedJSON objects
public class ExtendedJSONEncoder {
    
    // MARK: Encoding
    public init(strategies: ExtendedJSONEncodingStrategies = .extendedJSON) {
        self.strategies = strategies
    }
    
    // MARK: Configuration
    
    /// Configures the behavior of the Extended JSON Encoder. See the documentation on `ExtendedJSONEncodingStrategies` for details.
    public var strategies: ExtendedJSONEncodingStrategies
    
}
