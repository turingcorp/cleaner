#import <UIKit/UIKit.h>

@class gtext;

@class gspatialtexture;

@interface mtextitemglyph:NSObject

-(instancetype)init:(NSString*)character x:(NSInteger)x y:(NSInteger)y size:(CGFloat)size;
-(void)rasterize;

@property(strong, nonatomic)gtext *spatial;
@property(copy, nonatomic)NSString *assetname;
@property(nonatomic)CGFloat atlaswidth;
@property(nonatomic)CGFloat atlasheight;
@property(nonatomic)CGFloat leftmargin;
@property(nonatomic)CGFloat topmargin;
@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGFloat x;
@property(nonatomic)CGFloat y;

@end