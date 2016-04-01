#import "mbuilding.h"

static CGFloat const buildingpadding = 20;

@implementation mbuilding

-(instancetype)init:(marea*)modelarea
{
    self = [super init];
    self.items = [NSMutableArray array];
    self.rawbuldings = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"buildings" withExtension:@"plist"]];

    [self addbuilding];
    
    return self;
}

#pragma mark public

-(void)addbuilding
{
    NSUInteger index = arc4random_uniform((CGFloat)self.rawbuldings.count);
    NSDictionary *rawbuilding = self.rawbuldings[index];
    mbuildingitem *building = [[mbuildingitem alloc] init:rawbuilding];
    building.spatial.x = 100;
    building.spatial.y = self.modelarea.screenheight - (building.spatial.height - buildingpadding);
    [building.spatial rasterize];
    
    [self.items addObject:building];
}

@end