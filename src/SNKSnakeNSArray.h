//
//  SNKSnakeNSArray.h
//  RattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#import <Foundation/Foundation.h>
#import "SNKWrapperSnake.h"

/// An SNKWrapperSnake wrapping an NSArray of SNKSnakes.
/// Format: `Array[String[hello\, world!],SNKSnakeNSString,String[backslash = \/],SNKSnakeNSString]`
@interface SNKSnakeNSArray : SNKWrapperSnake

/// Initialize this object with an empty array.
///
/// - Returns: The empty array.
- (id _Nonnull)init;

- (id _Nullable)initWithString:(NSString * _Nonnull)data error:(NSError * _Nullable * _Null_unspecified)error;

- (id _Nullable)initWithValue:(id _Nonnull)initValue error:(NSError * _Nullable * _Null_unspecified)error;

- (NSString * _Nonnull)serialize;

@end
