#import <Foundation/Foundation.h>
#import "SNKRattleSnakes.h"

#define chkErr(err) if(!err) { NSLog(@"%@",error); exit(-1); }

int main(int argc, char * argv[]) {
 @autoreleasepool {

	 NSError * error = nil;

	 SNKColorSnake * cs = [[SNKColorSnake alloc] initWithR:255 G:0 B:128];
	 
	 NSLog(@"cs = %@", cs);
	 
	 SNKSnakeNSString * ss = [[SNKSnakeNSString alloc] initWithValue:@"Hello, world!" error:&error];
	 chkErr(ss);
	 
	 NSLog(@"ss = %@", ss);
	 
	 SNKSnakeNSArray * sa = [[SNKSnakeNSArray alloc] initWithValue:@[cs, ss] error:&error];
	 chkErr(sa);
	 
	 NSLog(@"sa = %@", sa);
	 
	 // decoding example
	 
	 SNKColorSnake * decode = [[SNKColorSnake alloc] initWithString:@"Color[R=080 G=100 B=250]" error:&error];
	 chkErr(decode);
	 
	 NSLog(@"decode.r = %d, decode.g = %d, decode.b = %d",
		   [decode R],
		   [decode G],
		   [decode B]);
	 
	 return 0;
 }
}
