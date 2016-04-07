#import "mtextures.h"

@implementation mtextures

-(instancetype)init
{
    self = [super init];
    self.textures = [NSMutableDictionary dictionary];
    
    return self;
}

-(void)dealloc
{
    NSArray<NSNumber*> *textures = self.textures.allValues;
    NSUInteger counter = textures.count;
    
    for(NSInteger i = counter - 1; i >= 0; i--)
    {
        GLuint current = [textures[i] unsignedIntValue];
        glDeleteTextures(1, &current);
    }
    
    textures = nil;
    [self.textures removeAllObjects];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
#warning "check"
}

#pragma mark public

-(NSNumber*)textureforasset:(NSString*)asset srgb:(BOOL)srgb
{
    NSNumber *number = self.textures[asset];
    
    if(!number)
    {
        UIImage *image = [UIImage imageNamed:asset];
        GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:@{GLKTextureLoaderSRGB:@(srgb)} error:nil];
        GLuint texture = textureinfo.name;
        number = @(texture);
        self.textures[asset] = number;
    }
    
    return number;
}

@end