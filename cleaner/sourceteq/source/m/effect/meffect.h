#import "appdel.h"

static NSInteger const effectshotsize = 40;
static NSInteger const effectsmokesize = 50;
static NSInteger const effectcrownsize = 175;
static NSInteger const effectbombingsize = 75;

extern NSInteger effectshotpos;
extern NSInteger effectsmokepos;
extern NSInteger effectcrownpos;
extern NSInteger effectbombingpos;

@class meffectitem;

@interface meffect:NSObject

-(void)shotatx:(NSInteger)x y:(NSInteger)y;
-(void)smokeatx:(NSInteger)x y:(NSInteger)y;
-(void)crownat:(NSInteger)x;
-(void)bombingatx:(NSInteger)x y:(NSInteger)y;

@property(strong, nonatomic)NSMutableArray<meffectitem*> *items;

@end