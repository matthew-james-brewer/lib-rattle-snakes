//
//  SNKWrapperSnake.m
//  libRattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#import "SNKWrapperSnake.h"

@implementation SNKWrapperSnake

- (id)initWithValue:(id)initValue error:(NSError **)error {
    if(self = [super init]) {
        _value = initValue;
        return self;
    } else {
        return nil;
    }
}

@end
