#import "mgamehubscore.h"

static NSUInteger const scorex = 220;
static NSUInteger const scorey = 12;

@implementation mgamehubscore
{
    NSUInteger score;
    BOOL shouldprint;
}

-(instancetype)init:(mtext*)model
{
    self = [super init];
    score = 0;
    shouldprint = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    if(shouldprint)
    {
        shouldprint = NO;
        
        [self printscore];
    }
}

#pragma mark functionality

-(void)printscore
{
    NSString *totalstring = [[tools singleton] numbertostring:@(score)];
    
    [self.modeltext remove];
    self.modeltext = [self.model addtotalscore:totalstring x:scorex y:scorey];
}

#pragma mark public

-(void)addscore:(NSUInteger)addscore
{
    score += addscore;
    shouldprint = YES;
}

@end