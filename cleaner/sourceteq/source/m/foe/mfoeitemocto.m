#import "mfoeitemocto.h"

static NSInteger const life = 15;
static NSInteger const damage = 5;
static NSUInteger const score = 8;

@implementation mfoeitemocto

-(instancetype)init:(mfoe*)model x:(NSInteger)x
{
    self = [super init:model x:x];
    self.life = life;
    self.damage = damage;
    self.score = score;
    
    [self spatial:[mtextures singleton].textures_foeocto];
    
    return self;
}

@end