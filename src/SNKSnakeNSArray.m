//
//  SNKSnakeNSArray.m
//  RattleSnakes
//
//  © 2025 Matthew Brewer
//
// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#import "SNKSnakeNSArray.h"

@implementation SNKSnakeNSArray

- (id)initWithString:(NSString *)data error:(NSError **)error {
	if([data length] < 7) {
		if(error) {
			*error = [NSError errorWithDomain:@"com.snakes.libRattleSnakes"
										 code:SNKFormatError
									 userInfo:@{ NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Invalid SNKSnakeNSArray data: \"%@\"",data] }];
		}
		return nil;
	}
	NSString * rawString = [data substringWithRange:NSMakeRange(6, ([data length] - 1) - 6)];
	NSRegularExpression * splitter = [NSRegularExpression regularExpressionWithPattern:@"(?<!\\\\)," options:0 error:error];
	NSString * splitString = [splitter stringByReplacingMatchesInString:rawString options:0 range:NSMakeRange(0, [rawString length]) withTemplate:@"\x00"];
	NSArray * chunks = [splitString componentsSeparatedByString:@"\x00"];
	
	NSMutableArray * returnV = [NSMutableArray array];
	NSEnumerator * en = [chunks objectEnumerator];
	NSString * object;
	NSString * class;
	while(object = [en nextObject]) {
		class = [en nextObject];
		Class snake = NSClassFromString(class);
		if(!snake || ![snake isSubclassOfClass:[SNKSnake class]]) {
			if(error) {
				*error = [NSError errorWithDomain:@"com.snakes.libRattleSnakes"
										  code:SNKFormatError
									  userInfo:@{ NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Invalid SNKSnakeNSArray data: \"%@\", not a snake type: %@",data,class] }];
			}
		 return nil;
		}
		// replace '\,' with ',', and then '\/' with '\'
		object = [object stringByReplacingOccurrencesOfString:@"\\," withString:@","];
		object = [object stringByReplacingOccurrencesOfString:@"\\/" withString:@"\\"];
		SNKSnake * newObj = [[snake alloc] initWithString:object error:error];
		[returnV addObject:newObj];
	}
	
	return [self initWithValue:returnV error:error];
}

- (id)init {
	return [self initWithValue:@[] error:nil];
}

- (id)initWithValue:(id)initValue error:(NSError **)error {
	if(self = [super init]) {
		for(id obj in initValue) {
			if(![obj isKindOfClass:[SNKSnake class]]) {
				if(error) {
					*error = [NSError errorWithDomain:@"com.snakes.libRattleSnakes"
												 code:SNKInvalidInitValue
											 userInfo:@{ NSLocalizedDescriptionKey: @"Invalid SNKSnakeNSArray value; array must be of SNKSnakes." }];
				}
				return nil;
			}
		}
		super.value = initValue;
		return self;
	} else {
		return nil;
	}
}

- (NSString *)serialize {
	NSMutableArray * serializations = [NSMutableArray array];
	for(id obj in [self value]) {
		NSString * data = [(SNKSnake *)obj serialize];
		// replace '\' with '\/' and then ',' with '\,'
		data = [data stringByReplacingOccurrencesOfString:@"\\" withString:@"\\/"];
		data = [data stringByReplacingOccurrencesOfString:@"," withString:@"\\,"];
		[serializations addObject:data];
		[serializations addObject:[obj class]];
	}
	NSString * list = [serializations componentsJoinedByString:@","];
	return [NSString stringWithFormat:@"Array[%@]", list];
}
@end
