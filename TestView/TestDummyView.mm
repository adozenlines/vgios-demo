// TestDummyView.mm
// Copyright (c) 2012-2015, https://github.com/rhcad/vgios-demo, BSD License
//

#import "TestDummyView.h"
#import "GiViewHelper.h"
#import "GiPaintView.h"
#import "ARCMacro.h"

@implementation TestDummyView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self image];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self image];
    });
}

- (UIImage *)image {
    GiViewHelper *hlp = [[[GiViewHelper alloc]init] AUTORELEASE];
    GiPaintView *view = [hlp createDummyView:CGSizeMake(100, 100)];
    
    [hlp addShapesForTest];
    UIImage *image = [hlp snapshot];
    
    [view removeFromSuperview];
    return image;
}

@end
