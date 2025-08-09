//
//  SNKSnake.h
//  libRattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#ifndef SNKSnake_h
#define SNKSnake_h

#import <Foundation/Foundation.h>

/// An error code for a SNK-specific error.
typedef NS_ENUM(NSInteger, SNKFormatCode) {
 /// Used in ``SNKSnake/initWithString:error:`` if the format is incorrect.
 SNKFormatError = 5,
 /// Used in ``SNKWrapperSnake/initWithValue:error:`` if the object is initialized with an invalid value.
 SNKInvalidInitValue = 6
};

// debugging statement, will remove later:
#define NSPRINT(x) NSLog(@"%@",x)

/// `SNKSnake` is an abstract class to represent an object that can be serialized or deserialized from text.
///
/// If you subclass `SNKSnake`, you will need to implement these methods: `serialize`, `initWithString`. An example of a subclass is ``SNKColorSnake``.

@interface SNKSnake : NSObject

/// (ABSTRACT) Serialize this object to a textual representation.
///
/// - Returns: The serialized object.
- (NSString * _Nonnull)serialize;

/// (ABSTRACT) Initialize this object from a serialized representation.
///
/// - Parameter data: The serialized representation.
/// - Parameter error: A pointer to an `NSError` object, or `NULL` if you're not handling errors. If the string passed to this method isn't valid, this will contain an error with code `SNKFormatError`.
///
/// - Returns: Either the newly deserialized object, or `nil` if it fails.
- (id _Nullable)initWithString:(NSString * _Nonnull)data error:(NSError * _Nullable * _Null_unspecified)error;

/// Serializes the object to a file.
///
/// - Parameter fileName: The file to save to.
/// - Parameter error: A pointer to an `NSError` object, or `NULL` if you're not handling errors. If the file write fails, that error will be stored here.
///
/// - Returns: whether the file write succeeds (`YES`) or fails (`NO`).
- (BOOL)serializeToFile:(NSString * _Nonnull)fileName error:(NSError * _Nullable * _Null_unspecified)error;

/// Initialize this object from a serialized representation stored in a file.
///
/// - Parameter fileName: The file to load from.
/// - Parameter error: A pointer to an `NSError` object, or `NULL` if you're not handling errors. If either the file read or the deserialization fails, this will contain a description of the error.
///
/// - Returns: Either the newly deserialized object, or `nil` if it fails.
- (id _Nullable)initWithFile:(NSString * _Nonnull)fileName error:(NSError * _Nullable * _Null_unspecified)error;

// I didn't add a docc comment here because description is inherited from NSObject. In my implementation, description simply returns [self serialize].
- (NSString * _Nonnull)description;

@end

#endif /* SNKSnake_h */
