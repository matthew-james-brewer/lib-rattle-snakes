//
//  SNKSnakeNSString.h
//  libRattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#import <Foundation/Foundation.h>
#import "SNKWrapperSnake.h"

/// An SNKWrapperSnake wrapping an NSString.
/// Format: `String[Hello, world!]`
@interface SNKSnakeNSString : SNKWrapperSnake

/// Initialize this object with an empty string.
///
/// - Returns: the empty object.
- (id _Nonnull)init;

- (id _Nullable)initWithString:(NSString * _Nonnull)data error:(NSError * _Nullable * _Null_unspecified)error;

- (NSString * _Nonnull)serialize;

@end
