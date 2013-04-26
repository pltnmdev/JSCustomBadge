/*
 JSCustomBadge.h
 
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


#import <UIKit/UIKit.h>

@interface JSCustomBadge : UIView

@property (strong, nonatomic) NSString *badgeText;
@property (strong, nonatomic) UIColor *badgeTextColor;
@property (strong, nonatomic) UIColor *badgeInsetColor;
@property (strong, nonatomic) UIColor *badgeFrameColor;

@property (assign, nonatomic) BOOL badgeFrame;
@property (assign, nonatomic) BOOL badgeShining;

@property (assign, nonatomic) CGFloat badgeCornerRoundness;
@property (assign, nonatomic) CGFloat badgeScaleFactor;

+ (JSCustomBadge *)customBadgeWithString:(NSString *)badgeString;

+ (JSCustomBadge *)customBadgeWithString:(NSString *)badgeString
                         withStringColor:(UIColor*)stringColor
                          withInsetColor:(UIColor*)insetColor
                          withBadgeFrame:(BOOL)badgeFrameYesNo
                     withBadgeFrameColor:(UIColor*)frameColor
                               withScale:(CGFloat)scale
                             withShining:(BOOL)shining;

// Use to change the badge text after the first rendering
- (void)autoBadgeSizeWithString:(NSString *)badgeString;

@end