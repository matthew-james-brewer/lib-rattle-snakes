//
//  SNKWrapperSnake.h
//  libRattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#import <Foundation/Foundation.h>
#import "SNKSnake.h"

/// `SNKWrapperSnake` is an abstract subclass of ``SNKSnake``. It represents an `SNKSnake` wrapper around a specific class.
@interface SNKWrapperSnake : SNKSnake

/// The object the snake wraps.
@property (retain) id _Nonnull value;

/// initWithValue sets the value with no checks, but you can override it to validate the new value.
///
/// - Parameter initValue: The object to initially store in `value`.
/// - Parameter error: A pointer to an `NSError` object, or `NULL` if you're not handling errors. If the value you try to store is invalid, this will contain an error with code `SNKInvalidInitValue`.
///
/// - Returns: The newly initialized object.
- (id _Nullable)initWithValue:(id _Nonnull)initValue error:(NSError * _Nullable * _Null_unspecified)error;

@end
