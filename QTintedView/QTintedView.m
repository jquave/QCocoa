//
//  QTintedNSView.m
//  QTintedNSView
//
//  Created by Jameson Quave on 8/3/11.
//  Copyright 2012 JQ Software LLC. All rights reserved.
//

#import "QTintedView.h"

@implementation QGradient
@synthesize startColor, endColor, angle;
+(QGradient *)gradientWithStartColor:(NSColor *)_startColor andEndColor:(NSColor *)_endColor {
    return [QGradient gradientWithStartColor:_startColor andEndColor:_endColor andAngle:90];
}
+(QGradient *)gradientWithStartColor:(NSColor *)_startColor andEndColor:(NSColor *)_endColor andAngle:(float)_angle {
    QGradient *qg = [[QGradient alloc] init];
    qg.endColor = _endColor;
    qg.startColor = _startColor;
    qg.angle = _angle;
    return qg;
}
@end


@implementation QTintedView

@synthesize hasFloor, gradient, backgroundColor;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        hasFloor = NO;
    }

    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    
    // Get the context
    CGContextRef context = (CGContextRef) [[NSGraphicsContext currentContext] graphicsPort];
    
    if(gradient) {
        NSGradient *whiteClearGradient = [[NSGradient alloc] initWithStartingColor:gradient.startColor
                                                                       endingColor:gradient.endColor];
        CGContextSaveGState(context);
        CGContextSetAlpha(context,1.0f);
        [whiteClearGradient drawInRect:dirtyRect angle:gradient.angle];
        [whiteClearGradient release];
        
        CGContextRestoreGState(context);
    }
    else {
        CGContextSetRGBFillColor(context, backgroundColor.redComponent, backgroundColor.greenComponent, backgroundColor.blueComponent, backgroundColor.alphaComponent);
        CGContextFillRect(context, NSRectToCGRect(dirtyRect));
    }
    
    // Draw floor 
    if(hasFloor) {
        NSBezierPath *bp = [NSBezierPath bezierPath];
        float height = 25;
        float yorigin = 5;
        float thinMargin = 50;
        float thickMargin = 65;
        [bp moveToPoint:NSMakePoint(thinMargin, yorigin)];
        [bp lineToPoint:NSMakePoint(self.frame.size.width-thinMargin, yorigin)];
        [bp lineToPoint:NSMakePoint(self.frame.size.width-thickMargin, yorigin+height)];
        [bp lineToPoint:NSMakePoint(thickMargin, yorigin+height)];

        NSGradient *g = [[NSGradient alloc] 
                         initWithStartingColor:[NSColor 
                                                colorWithDeviceRed:0.75f green:0.75f blue:0.85f alpha:1]
                         endingColor:[NSColor 
                                      colorWithDeviceRed:0.35f green:0.35f blue:0.45f alpha:1]];
        CGContextRef ctx = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
        CGContextSetShadowWithColor(ctx, CGSizeMake(1, 1), 20,CGColorCreateGenericGray(0, 0.5f));
        [bp fill];
        
        [g drawInBezierPath:bp angle:90];
        [g drawInRect:NSMakeRect(thinMargin, 0, self.frame.size.width-thinMargin*2, 5) angle:-90];
        [g release];

      //  [bp release];
    }
    
}

@end