//
//  UITextImageButton.m
//  ButtonTest
//
//  Created by zuopengl on 10/6/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import "UITextImageButton.h"

#define kTextImageButtonSpacingDefault (5.f)
#define kTextImageButtonPlaceholder    (5.f)


@implementation UITextImageButton

+ (UITextImageButton *)buttonWithTitle:(NSString *)title
                                 image:(UIImage *)image
{
    return [UITextImageButton buttonWithType:kUITextImageButtonTypeLeftText Title:title image:image];
}


+ (UITextImageButton *)buttonWithType:(NSUInteger)type
                                Title:(NSString *)title
                                image:(UIImage *)image
{
    UITextImageButton *button = [UITextImageButton buttonWithType:UIButtonTypeCustom];
    [button p_initWithType:type title:title image:image];
    
    return button;
}


- (void)setTitleImageType:(NSUInteger)type
{
    _type = type;
    
    [self layoutIfNeeded];
}


- (void)setSpacing:(CGFloat)spacing
{
    _spacing = spacing;
    
    [self layoutIfNeeded];
}


- (instancetype)p_initWithType:(NSUInteger)type
                       title:(NSString *)title
                       image:(UIImage *)image
{
    if (self) {
        _spacing = kTextImageButtonSpacingDefault;
        _type = type;
        _title = title;
        _image = image;
        
        [self p_initCustomViews];
    }
    return self;
}


- (void)p_initCustomViews
{
    [self setClipsToBounds:NO];
    [self.titleLabel setClipsToBounds:NO];
    [self.imageView setClipsToBounds:NO];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    [self setTitle:_title forState:UIControlStateNormal];
    [self setImage:_image forState:UIControlStateNormal];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIEdgeInsets titleInset = UIEdgeInsetsZero;
    UIEdgeInsets imageInset = UIEdgeInsetsZero;
    
    CGSize  titleSize = [_title sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    CGSize  imageSize = _image.size;
    CGFloat totalWidth = titleSize.width + imageSize.width;
    CGFloat totalHeight = titleSize.height + imageSize.height;
    CGFloat placeholder = kTextImageButtonPlaceholder;
    
    switch (_type) {
        case kUITextImageButtonTypeLeftText: {
            totalWidth = titleSize.width + _spacing + imageSize.width + 2 * placeholder;
            totalHeight = MAX(titleSize.height, imageSize.height) + 2 * placeholder;
            
            titleInset = UIEdgeInsetsMake((totalHeight - titleSize.height) * 0.5, - (imageSize.width - placeholder) , 0, 0);
            imageInset = UIEdgeInsetsMake((totalHeight - imageSize.height) * 0.5, titleSize.width + _spacing + placeholder, 0, 0);
        }
            break;
            
        case kUITextImageButtonTypeRightText: {
            totalWidth = titleSize.width + _spacing + imageSize.width + 2 * placeholder;
            totalHeight = MAX(titleSize.height, imageSize.height) + 2 * placeholder;
            
            titleInset = UIEdgeInsetsMake((totalHeight - titleSize.height) * 0.5, _spacing + placeholder , 0, 0);
            imageInset = UIEdgeInsetsMake((totalHeight - imageSize.height) * 0.5, placeholder, 0, 0);
        }
            break;
            
        case kUITextImageButtonTypeTopText: {
            totalWidth = MAX(titleSize.width, imageSize.width) + 2 * placeholder;
            totalHeight = titleSize.height + _spacing + imageSize.height + 2 * placeholder;
            
            titleInset = UIEdgeInsetsMake(placeholder, - (imageSize.width - placeholder), 0, 0);
            imageInset = UIEdgeInsetsMake(titleSize.height + _spacing + placeholder, (totalWidth - imageSize.width) * 0.5, 0, 0);
        }
            break;
            
        case kUITextImageButtonTypeBottomText: {
            totalWidth = MAX(titleSize.width, imageSize.width) + 2 * placeholder;
            totalHeight = titleSize.height + _spacing + imageSize.height + 2 * placeholder;
            
            titleInset = UIEdgeInsetsMake(imageSize.height + _spacing + placeholder, - (imageSize.width - placeholder), 0, 0);
            imageInset = UIEdgeInsetsMake(placeholder, (totalWidth - imageSize.width) * 0.5, 0, 0);
        }
            break;
            
        default:
            break;
    }
    
    self.titleEdgeInsets = titleInset;
    self.imageEdgeInsets = imageInset;
    
    self.frame = CGRectIntegral(CGRectMake(self.frame.origin.x, self.frame.origin.y, totalWidth, totalHeight));
}


@end
