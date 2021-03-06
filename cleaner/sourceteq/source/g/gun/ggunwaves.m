#import "ggunwaves.h"

static CGFloat const red = 1;
static CGFloat const green = 1;
static CGFloat const blue = 1;
static CGFloat const alpha = 0.6;

@implementation ggunwaves
{
    GLKMatrix4 rotationmatrix;
}

-(instancetype)init:(CGFloat)rotation x:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height realx:(NSInteger)realx realy:(NSInteger)realy
{
    self = [super init:[mcolor red:red green:green blue:blue alpha:alpha]];
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;
    
    GLKMatrix4 transmat = GLKMatrix4MakeTranslation(realx, realy, 0);
    GLKMatrix4 rotmat = GLKMatrix4MakeRotation(rotation, 0, 0, 1);
    rotationmatrix = GLKMatrix4Multiply(transmat, rotmat);
    [self render];
    
    return self;
}

#pragma mark -
#pragma mark g spatial

-(void)draw
{
    globaltransform.modelviewMatrix = rotationmatrix;
    
    [super draw];
    
    globaltransform.modelviewMatrix = rotationclear;
}

@end