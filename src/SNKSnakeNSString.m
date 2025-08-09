//
//  SNKSnakeNSString.m
//  libRattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#import "SNKSnakeNSString.h"

@implementation SNKSnakeNSString

- (id)initWithString:(NSString *)data error:(NSError **)error {
    if([data length] < 8) {
        if(error) {
            *error = [NSError errorWithDomain:@"com.snakes.libRattleSnakes"
                                         code:SNKFormatError
                                     userInfo:@{ NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Invalid SNKSnakeNSString data: \"%@\"",data] }];
        }
        return nil;
    }
    NSString * snakeData = [data substringWithRange:NSMakeRange(7, ([data length] - 1) - 7)];
	return [self initWithValue:snakeData error:error];
}

- (id)init {
	return [self initWithValue:@"" error:nil];
}

- (NSString *)serialize {
    return [NSString stringWithFormat:@"String[%@]",[self value]];
}

@end
