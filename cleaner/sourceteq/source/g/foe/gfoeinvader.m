#import "gfoeinvader.h"

@implementation gfoeinvader

@dynamic model;

-(instancetype)init:(mfoeiteminvader*)model
{
    self = [super init:model];
    self.x = 100;
    self.y = 100;
    self.width = 50;
    self.height = 50;
    [self.image loadtextures:@[@"foe_invader0", @"foe_invader1", @"foe_invader2"]];
    [self rasterize];
    
    return self;
}

@end