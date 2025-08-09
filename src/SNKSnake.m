//
//  SNKSnake.m
//  libRattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#import "SNKSnake.h"

// Credit for mustOverride: @dan-rosenstark (Stack Overflow)
#define mustOverride() @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"%s must be overridden in a subclass/category", __PRETTY_FUNCTION__] userInfo:nil]

@implementation SNKSnake

- (BOOL)serializeToFile:(NSString *)fileName error:(NSError **)error {
    return [[self serialize] writeToFile:fileName atomically:NO encoding:NSUTF8StringEncoding error:error];
}

- (id)initWithFile:(NSString *)fileName error:(NSError **)error {
    NSString * fileData = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:error];
    if(fileData == nil) {
        return nil;
    } else {
        return [self initWithString:fileData error:error];
    }
}

- (NSString *)description {
    return [self serialize];
}

// -------------------------------------------------------------------------------------------------------------------

- (id)initWithString:(NSString *)data error:(NSError **)error { mustOverride(); }
- (NSString *)serialize { mustOverride(); }

@end
