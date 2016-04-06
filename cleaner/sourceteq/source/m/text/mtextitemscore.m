#import "mtextitemscore.h"

static CGFloat const padding = 6;
static CGFloat const sizescore = 0.35;
static NSInteger const ttlscore = 70;
static NSUInteger const speed = 1;

@implementation mtextitemscore
{
    NSUInteger current;
}

-(instancetype)init:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model text:text x:x y:y];
    self.ttl = ttlscore;
    self.size = sizescore;
    self.padding = - sizescore * padding;
    current = 0;
    [self render];
    
    return self;
}

#pragma mark notified

-(void)notifiedmove
{
    current++;
    
    if(current > speed)
    {
        current = 0;
        
        for(mtextitemglyph *glyph in self.glyphs)
        {
            glyph.spatial.y--;
            [glyph.spatial render];
        }
    }
    
    [super notifiedmove];
}

@end