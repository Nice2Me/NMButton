//
//  UITextImageButton.h
//
//  Created by zuopengl on 10/6/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, UITextImageButtonType) {
    kUITextImageButtonTypeLeftText,
    kUITextImageButtonTypeRightText,
    kUITextImageButtonTypeTopText,
    kUITextImageButtonTypeBottomText,
};


@interface UITextImageButton : UIButton

@property (nonatomic, assign, readonly) NSUInteger type;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, assign, readonly) CGFloat spacing;

+ (UITextImageButton *)buttonWithTitle:(NSString *)title
                                 image:(UIImage *)image;

+ (UITextImageButton *)buttonWithType:(NSUInteger)type
                                Title:(NSString *)title
                                 image:(UIImage *)image;

- (void)setTitleImageType:(NSUInteger)type;
- (void)setSpacing:(CGFloat)spacing;


@end
