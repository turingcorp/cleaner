#import <UIKit/UIKit.h>
#import "gspatial.h"
#import "gimage.h"

@interface gspatialtexture:gspatial

-(instancetype)init:(NSArray<NSNumber*>*)assets;
-(gimage*)image;

@end