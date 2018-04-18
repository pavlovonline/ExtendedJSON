import Foundation
import BSON

public struct ExtendedJSONEncodingStrategies {
    public enum BinaryEncodingStrategy {
        /// Encode binary data as defined in the Extended JSON spec
        ///
        /// `{ "$binary": "<bindata>", "$type": "<t>" }`
        case extendedJSON
        
        /// Encode binary data as a base64 string. The type identifier will be lost.
        case base64
        
        /// Use a custom encoding
        case custom((Binary, Encoder) throws -> Void)
    }
    
    public enum DataEncodingStrategy {
        /// Encode binary data as defined in the Extended JSON spec. The type identifier will be set to `0`.
        ///
        /// `{ "$binary": "<bindata>", "$type": "<t>" }`
        case extendedJSON
        
        /// Encode binary data as a base64 string. The type identifier will be lost.
        case base64
        
        /// Use a custom encoding
        case custom((Data, Encoder) throws -> Void)
        
        /// Use the default `Binary` encoding
        case deferredToData
    }
    
    public enum DateEncodingStrategy {
        /// Encode dates as defined in the Extended JSON spec.
        ///
        /// { "$date": "YYYY-MM-DDTHH:mm:ss.mmm<+/-Offset>" }
        case extendedJSON
        
        /// Encodes dates using ISO8601DateFormatter
        case iso8601
        
        /// Encodes dates using the given formatter
        case formatted(DateFormatter)
        
        /// Uses a custom date encoding strategy
        case custom((Date, Encoder) throws -> Void)
        
        /// Encodes dates as a number representing the number of milliseconds since 1970
        case millisecondsSince1970
        
        /// Encodes dates as a number representing the number of seconds since 1970
        case secondsSince1970
    }
    
    public enum ObjectIdEncodingStrategy {
        /// Encodes ObjectIds as defined in the Extended JSON spec.
        ///
        /// `{ "$oid": "<id>" }`
        case extendedJSON
        
        /// Encodes ObjectIds as a 24-character hex string
        case hexString
    }
    
    public enum Int64EncodingStrategy {
        /// Encodes Int64s as defined in the Extended JSON spec
        ///
        /// `{ "$numberLong": "<number>" }`
        case extendedJSON
        
        /// Encodes Int64s as JSON numbers. Some precision loss may occur.
        case number
    }
    
    /// Defines how optionals that are `nil` are encoded in keyed containers
    ///
    /// Note that for unkeyed containers, like arrays, `nil` is always encoded as `null`
    public enum KeyedNilEncodingStrategy {
        /// A value of `nil` is encoded as null
        case null
        
        /// a value of `nil` is not encoded at all
        case omitted
    }
    
    /// Defines how `BSON.Binary` instances are encoded
    public var binaryEncodingStrategy: BinaryEncodingStrategy
    
    /// Defines how `Foundation.Data` instances are encoded
    public var dataEncodingStrategy: DataEncodingStrategy
    
    /// Defines how `Foundation.Date` instances are encoded
    public var dateEncodingStrategy: DateEncodingStrategy
    
    /// Defines how `BSON.ObjectId` instances are encoded
    public var objectIdEncodingStrategy: ObjectIdEncodingStrategy
    
    /// Defines how `Int64` and `Int` values are encoded
    public var int64EncodingStrategy: Int64EncodingStrategy
    
    /// Defines how optionals that are `nil` are encoded in keyed containers
    public var keyedNilEncodingStrategy: KeyedNilEncodingStrategy
    
    public static var extendedJSON: ExtendedJSONEncodingStrategies {
        return .init(
            binaryEncodingStrategy: .extendedJSON,
            dataEncodingStrategy: .extendedJSON,
            dateEncodingStrategy: .extendedJSON,
            objectIdEncodingStrategy: .extendedJSON,
            int64EncodingStrategy: .extendedJSON,
            keyedNilEncodingStrategy: .omitted
        )
    }
    
    public static var json: ExtendedJSONEncodingStrategies {
        return .init(
            binaryEncodingStrategy: .base64,
            dataEncodingStrategy: .base64,
            dateEncodingStrategy: .iso8601,
            objectIdEncodingStrategy: .hexString,
            int64EncodingStrategy: .number,
            keyedNilEncodingStrategy: .omitted
        )
    }
}
