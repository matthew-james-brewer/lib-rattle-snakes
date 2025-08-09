//
//  SNKColorSnake.h
//  libRattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#ifndef SNKColorSnake_h
#define SNKColorSnake_h

#import <Foundation/Foundation.h>
#import "SNKSnake.h"

/// An `SNKSnake` implementation representing an RGB value.
/// Format: `Color[R=000 G=000 B=000]`
@interface SNKColorSnake: SNKSnake

/// Initializes this object with red=0, green=0, blue=0.
///
/// - Returns: The empty object.
- (id _Nonnull)init;

- (id _Nullable)initWithString:(NSString * _Nonnull)data error:(NSError * _Nullable * _Null_unspecified)error;

/// Initializes this object with the specified color.
///
/// - Parameters:
///  - r: red amount from 0-255
///  - g: green amount from 0-255
///  - b: blue amount from 0-255
///
/// - Returns: The initialized object.
- (id _Nonnull)initWithR:(int)r G:(int)gg B:(int)bb;

- (NSString * _Nonnull)serialize;

/// Get the red amount.
///
/// - Returns: the red amount.
- (int)R;

/// Get the green amount.
///
/// - Returns: the green amount.
- (int)G;

/// Get the blue amount.
///
/// - Returns: the blue amount.
- (int)B;

@end

#endif /* SNKColorSnake_h */
