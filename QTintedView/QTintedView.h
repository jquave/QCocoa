//
//  QTintedView.h
//  QTintedView
//
//  Created by Jameson Quave on 8/3/11.
//  Copyright 2012 JQ Software LLC. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface QGradient : NSObject {
    NSColor *startColor;
    NSColor *endColor;
    float angle;
}
@property (nonatomic, assign) NSColor *startColor;
@property (nonatomic, assign) NSColor *endColor;
@property (nonatomic, assign) float angle;
+(QGradient *)gradientWithStartColor:(NSColor *)_startColor andEndColor:(NSColor *)_endColor;
+(QGradient *)gradientWithStartColor:(NSColor *)_startColor andEndColor:(NSColor *)_endColor andAngle:(float)_angle;
@end


@interface QTintedView : NSView {
    NSColor *backgroundColor;
    BOOL hasFloor;
    QGradient *gradient;
}

@property (nonatomic, assign) BOOL hasFloor;
@property (nonatomic, retain) QGradient *gradient;
@property (nonatomic, retain) NSColor *backgroundColor;

@end
