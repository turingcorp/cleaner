#import "mgunwaves.h"

static CGFloat const maxwavelong = 30;
static NSInteger const minwavelong = 1;
static NSInteger const waveshort = 6;
static NSInteger const interitem = 2;

@implementation mgunwaves
{
    NSInteger waveshort_2;
}

-(instancetype)init
{
    self = [super init];
    waveshort_2 = waveshort / 2.0;
    
    return self;
}

#pragma mark public

-(void)restart:(CGFloat)initx inity:(CGFloat)inity centerx:(CGFloat)centerx centery:(CGFloat)centery finalx:(CGFloat)finalx finaly:(CGFloat)finaly
{
    self.items = [NSMutableArray array];
    BOOL horizontal;
    CGFloat angle = atan((finaly - inity) / (finalx - initx));
    CGFloat deltaother;
    NSInteger auxx = initx;
    NSInteger auxy = inity;
    NSInteger deltax = fabs(initx - finalx);
    NSInteger deltay = fabs(inity - finaly);
    NSInteger wavelength = waveshort + interitem;
    NSInteger total;
    NSInteger editorhr = 0;
    NSInteger editorvr = 0;
    
    if(deltay > deltax)
    {
        horizontal = NO;
        total = deltay / wavelength;
        deltaother = deltax / (CGFloat) total;
    }
    else
    {
        horizontal = YES;
        total = deltax / wavelength;
        deltaother = deltay / (CGFloat) total;
    }
    
    if(initx > finalx)
    {
        editorhr = -1;
    }
    else
    {
        editorhr = 1;
    }
    
    if(inity > finaly)
    {
        editorvr = -1;
    }
    else
    {
        editorvr = 1;
    }
    
    for(NSInteger i = 0; i < total; i++)
    {
        NSInteger randomwave = arc4random_uniform(maxwavelong) + minwavelong;
        NSInteger randomwave_2 = randomwave / 2.0;
        NSInteger wx;
        NSInteger wy;
        NSInteger wwidth;
        NSInteger wheight;
        
        if(horizontal)
        {
            auxx += waveshort * editorhr;
            auxy += deltaother * editorvr;
            wx = -waveshort_2;
            wy = -randomwave_2;
            wwidth = waveshort;
            wheight = randomwave;
        }
        else
        {
            auxx += deltaother * editorhr;
            auxy += waveshort * editorvr;
            wx = -randomwave_2;
            wy = -waveshort_2;
            wwidth = randomwave;
            wheight = waveshort;
        }
        
        ggunwaves *wave = [[ggunwaves alloc] init:angle x:wx y:wy width:wwidth height:wheight realx:auxx realy:auxy];
        [self.items addObject:wave];
        
        if(horizontal)
        {
            auxx += interitem * editorhr;
        }
        else
        {
            auxy += interitem * editorvr;
        }
    }
}

-(void)clear
{
    self.items = nil;
}


@end