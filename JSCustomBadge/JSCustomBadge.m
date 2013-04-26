/*
 JSCustomBadge.m
 
 *** Description: ***
 With this class you can draw a typical iOS badge indicator with a custom text on any view.
 Please use the allocator customBadgeWithString to create a new badge.
 In this version you can modfiy the color inside the badge (insetColor),
 the color of the frame (frameColor), the color of the text and you can
 tell the class if you want a frame around the badge.
 
 *** License & Copyright ***
 Created by Sascha Marc Paulus www.spaulus.com on 04/2011. Version 2.0
 This tiny class can be used for free in private and commercial applications.
 Please feel free to modify, extend or distribution this class. 
 If you modify it: Please send me your modified version of the class.
 A commercial distribution of this class is not allowed.
 
 I would appreciate if you could refer to my website www.spaulus.com if you use this class.
 
 If you have any questions please feel free to contact me (open@spaulus.com).
 */


#import "JSCustomBadge.h"

@interface JSCustomBadge()

- (id)initWithString:(NSString *)badgeString withScale:(CGFloat)scale withShining:(BOOL)shining;

- (id)initWithString:(NSString *)badgeString
     withStringColor:(UIColor *)stringColor
      withInsetColor:(UIColor *)insetColor
      withBadgeFrame:(BOOL)badgeFrameYesNo
 withBadgeFrameColor:(UIColor *)frameColor
           withScale:(CGFloat)scale
         withShining:(BOOL)shining;

- (void)drawRoundedRectWithContext:(CGContextRef)context withRect:(CGRect)rect;
- (void)drawShineWithContext:(CGContextRef)context withRect:(CGRect)rect;
- (void)drawFrameWithContext:(CGContextRef)context withRect:(CGRect)rect;

@end



@implementation JSCustomBadge

#pragma mark - Initialization
- (id)initWithString:(NSString *)badgeString withScale:(CGFloat)scale withShining:(BOOL)shining
{
	self = [super initWithFrame:CGRectMake(0.0f, 0.0f, 25.0f, 25.0f)];
    
	if(self) {
		self.contentScaleFactor = [[UIScreen mainScreen] scale];
		self.backgroundColor = [UIColor clearColor];
		self.badgeText = badgeString;
		self.badgeTextColor = [UIColor whiteColor];
		self.badgeFrame = YES;
		self.badgeFrameColor = [UIColor whiteColor];
		self.badgeInsetColor = [UIColor redColor];
		self.badgeCornerRoundness = 0.4f;
		self.badgeScaleFactor = scale;
		self.badgeShining = shining;
		[self autoBadgeSizeWithString:badgeString];		
	}
    
	return self;
}

- (id)initWithString:(NSString *)badgeString
     withStringColor:(UIColor *)stringColor
      withInsetColor:(UIColor *)insetColor
      withBadgeFrame:(BOOL)badgeFrameYesNo
 withBadgeFrameColor:(UIColor *)frameColor
           withScale:(CGFloat)scale
         withShining:(BOOL)shining
{
	self = [super initWithFrame:CGRectMake(0.0f, 0.0f, 25.0f, 25.0f)];
    
	if(self) {
		self.contentScaleFactor = [[UIScreen mainScreen] scale];
		self.backgroundColor = [UIColor clearColor];
		self.badgeText = badgeString;
		self.badgeTextColor = stringColor;
		self.badgeFrame = badgeFrameYesNo;
		self.badgeFrameColor = frameColor;
		self.badgeInsetColor = insetColor;
		self.badgeCornerRoundness = 0.4f;
		self.badgeScaleFactor = scale;
		self.badgeShining = shining;
		[self autoBadgeSizeWithString:badgeString];
	}
    
	return self;
}

#pragma mark - Class initializers
+ (JSCustomBadge *) customBadgeWithString:(NSString *)badgeString
{
	return [[JSCustomBadge alloc] initWithString:badgeString withScale:1.0f withShining:YES];
}

+ (JSCustomBadge *) customBadgeWithString:(NSString *)badgeString
                          withStringColor:(UIColor *)stringColor
                           withInsetColor:(UIColor *)insetColor
                           withBadgeFrame:(BOOL)badgeFrameYesNo
                      withBadgeFrameColor:(UIColor *)frameColor
                                withScale:(CGFloat)scale
                              withShining:(BOOL)shining
{
	return [[JSCustomBadge alloc] initWithString:badgeString
                                 withStringColor:stringColor
                                  withInsetColor:insetColor
                                  withBadgeFrame:badgeFrameYesNo
                             withBadgeFrameColor:frameColor
                                       withScale:scale
                                     withShining:shining];
}

#pragma mark - Utilities
- (void)autoBadgeSizeWithString:(NSString *)badgeString
{
	CGSize retValue;
	CGFloat rectWidth, rectHeight;
	CGSize stringSize = [badgeString sizeWithFont:[UIFont boldSystemFontOfSize:12.0f]];
	CGFloat flexSpace;
	
    if([badgeString length] >= 2.0f) {
		flexSpace = [badgeString length];
		rectWidth = 25.0f + (stringSize.width + flexSpace); rectHeight = 25.0f;
		retValue = CGSizeMake(rectWidth * self.badgeScaleFactor, rectHeight * self.badgeScaleFactor);
	}
    else {
		retValue = CGSizeMake(25.0f * self.badgeScaleFactor, 25.0f * self.badgeScaleFactor);
	}
	
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, retValue.width, retValue.height);
	self.badgeText = badgeString;
	
    [self setNeedsDisplay];
}



#pragma mark - Drawing
- (void)drawRoundedRectWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);
	
	CGFloat radius = CGRectGetMaxY(rect) * self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect) * 0.1f;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
		
    CGContextBeginPath(context);
	CGContextSetFillColorWithColor(context, [self.badgeInsetColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2.0f), 0.0f, 0.0f);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0.0f, M_PI/2.0f, 0.0f);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2.0f, M_PI, 0.0f);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2.0f, 0.0f);
	CGContextSetShadowWithColor(context, CGSizeMake(1.0f, 1.0f), 1.5f, [UIColor blackColor].CGColor);
    CGContextFillPath(context);

	CGContextRestoreGState(context);
}

- (void)drawShineWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);
 
	CGFloat radius = CGRectGetMaxY(rect) * self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect) * 0.1f;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
    
	CGContextBeginPath(context);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2.0f), 0.0f, 0.0f);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0.0f, M_PI/2.0f, 0.0f);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2.0f, M_PI, 0.0f);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2.0f, 0.0f);
	CGContextClip(context);
	
	size_t num_locations = 2.0f;
	CGFloat locations[2] = { 0.0f, 0.4f };
	CGFloat components[8] = {  0.92f, 0.92f, 0.92f, 1.0f, 0.82f, 0.82f, 0.82f, 0.4f };

	CGColorSpaceRef cspace;
	CGGradientRef gradient;
	cspace = CGColorSpaceCreateDeviceRGB();
	gradient = CGGradientCreateWithColorComponents (cspace, components, locations, num_locations);
	
	CGPoint sPoint, ePoint;
	sPoint.x = 0.0f;
	sPoint.y = 0.0f;
	ePoint.x = 0.0f;
	ePoint.y = maxY;
	CGContextDrawLinearGradient (context, gradient, sPoint, ePoint, 0.0f);
	
	CGColorSpaceRelease(cspace);
	CGGradientRelease(gradient);
	
	CGContextRestoreGState(context);	
}

- (void)drawFrameWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGFloat radius = CGRectGetMaxY(rect) * self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect) * 0.1f;
	
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
	
    CGContextBeginPath(context);
	CGFloat lineSize = 2.0f;
    
	if(self.badgeScaleFactor > 1.0f) {
		lineSize += self.badgeScaleFactor * 0.25f;
	}
    
	CGContextSetLineWidth(context, lineSize);
	CGContextSetStrokeColorWithColor(context, [self.badgeFrameColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI + (M_PI/2.0f), 0.0f, 0.0f);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0.0f, M_PI/2.0f, 0.0f);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2.0f, M_PI, 0.0f);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2.0f, 0.0f);
	
    CGContextClosePath(context);
	CGContextStrokePath(context);
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

	[self drawRoundedRectWithContext:context withRect:rect];
	
	if(self.badgeShining)
		[self drawShineWithContext:context withRect:rect];
	
	if(self.badgeFrame)
		[self drawFrameWithContext:context withRect:rect];
	
	if([self.badgeText length] > 0.0f) {
        
		[self.badgeTextColor set];
		CGFloat sizeOfFont = 13.5f * self.badgeScaleFactor;
		
        if([self.badgeText length] < 2.0f) {
			sizeOfFont += sizeOfFont * 0.2f;
		}
        
		UIFont *textFont = [UIFont boldSystemFontOfSize:sizeOfFont];
		CGSize textSize = [self.badgeText sizeWithFont:textFont];
		
        [self.badgeText drawAtPoint:CGPointMake((rect.size.width/2.0f - textSize.width/2.0f),
                                                (rect.size.height/2.0f - textSize.height/2.0f))
                           withFont:textFont];
	}	
}

@end
