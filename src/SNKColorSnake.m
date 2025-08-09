//
//  SNKColorSnake.m
//  libRattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#import "SNKColorSnake.h"

@implementation SNKColorSnake {
    int r;
    int g;
    int b;
}

- (id)initWithR:(int)rr G:(int)gg B:(int)bb {
    if(self = [super init]) {
        r = rr;
        g = gg;
        b = bb;
        return self;
    } else {
        return nil;
    }
}

- (id)init {
    return [self initWithR:0 G:0 B:0];
}

- (id)initWithString:(NSString *)data error:(NSError **)error {

    BOOL fail = NO;

    if([data length] == 24) {
        NSString * R = [data substringWithRange:NSMakeRange(8,3)];
        NSString * G = [data substringWithRange:NSMakeRange(14,3)];
        NSString * B = [data substringWithRange:NSMakeRange(20,3)];

        NSNumberFormatter * getInt = [[NSNumberFormatter alloc] init];

        NSNumber * rn; if(!(rn = [getInt numberFromString:R])) fail = YES;
        NSNumber * gn; if(!(gn = [getInt numberFromString:G])) fail = YES;
        NSNumber * bn; if(!(bn = [getInt numberFromString:B])) fail = YES;

		if(!fail) {
			return [self initWithR: [rn intValue]
								 G: [gn intValue]
								 B: [bn intValue]
			];
		}
    }
    if(error) {
        *error = [NSError errorWithDomain:@"com.snakes.libRattleSnakes"
                                         code:SNKFormatError
                                 userInfo:@{ NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Invalid SNKColorSnake data: \"%@\"",data] }];
    }
    return nil;
}

- (NSString *)serialize {

    // format example: @"Color[R=000 G=000 B=000]"

    return [NSString stringWithFormat:@"Color[R=%03d G=%03d B=%03d]",r,g,b];
}

- (int)getR {
    return r;
}
- (int)getG {
    return g;
}
- (int)getB {
    return b;
}

@end
