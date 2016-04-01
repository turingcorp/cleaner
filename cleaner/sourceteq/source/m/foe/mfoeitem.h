#import "appdel.h"

@class gfoe;
@class mfoe;

@interface mfoeitem:NSObject

-(instancetype)init:(NSDictionary*)dictionary model:(mfoe*)model;
-(void)rasterize:(CGFloat)x;

@property(strong, nonatomic)gfoe *spatial;
@property(weak, nonatomic)mfoe *model;

@end