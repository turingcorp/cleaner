#import "appdel.h"

@class mtextitem;

@interface mtext:NSObject

-(void)addscoretext:(NSString*)text x:(NSInteger)x y:(NSInteger)y;
-(mtextitem*)totalscore:(NSString*)text x:(NSInteger)x y:(NSInteger)y;

@property(strong, nonatomic)NSMutableArray<mtextitem*> *items;

@end