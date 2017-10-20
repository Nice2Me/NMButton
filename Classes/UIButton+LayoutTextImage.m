//
//  UIButton+LayoutTextImage.m
//  NMButton
//
//  Created by zuopengliu on 20/10/2017.
//

#import "UIButton+LayoutTextImage.h"



#define kTextImageButtonPlaceholder    (5.f)

@implementation UIButton (LayoutTextImage)

- (void)layoutForStyle:(UIButtonLayoutStyle)newStyle
           withSpacing:(CGFloat)spacing
{
    [self layoutForStyle:newStyle withSpacing:spacing margin:5.f];
}

- (void)layoutForStyle:(UIButtonLayoutStyle)newStyle
           withSpacing:(CGFloat)spacing
                margin:(CGFloat)margin
{
    UIEdgeInsets titleInset = UIEdgeInsetsZero;
    UIEdgeInsets imageInset = UIEdgeInsetsZero;
    
    NSString *title = [self titleForState:UIControlStateNormal];
    UIImage *image  = [self imageForState:UIControlStateNormal];
    
    CGSize  titleSize = [title sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    CGSize  imageSize = image.size;
    CGFloat totalWidth = titleSize.width + imageSize.width;
    CGFloat totalHeight = titleSize.height + imageSize.height;
    CGFloat placeholder = margin;
    
    switch (newStyle) {
            case UIButtonLayoutStyleLeftText: {
                totalWidth = titleSize.width + spacing + imageSize.width + 2 * placeholder;
                totalHeight = MAX(titleSize.height, imageSize.height) + 2 * placeholder;
                
                titleInset = UIEdgeInsetsMake((totalHeight - titleSize.height) * 0.5, - (imageSize.width - placeholder) , 0, 0);
                imageInset = UIEdgeInsetsMake((totalHeight - imageSize.height) * 0.5, titleSize.width + spacing + placeholder, 0, 0);
            }
            break;
            
            case UIButtonLayoutStyleRightText: {
                totalWidth = titleSize.width + spacing + imageSize.width + 2 * placeholder;
                totalHeight = MAX(titleSize.height, imageSize.height) + 2 * placeholder;
                
                titleInset = UIEdgeInsetsMake((totalHeight - titleSize.height) * 0.5, spacing + placeholder , 0, 0);
                imageInset = UIEdgeInsetsMake((totalHeight - imageSize.height) * 0.5, placeholder, 0, 0);
            }
            break;
            
            case UIButtonLayoutStyleTopText: {
                totalWidth = MAX(titleSize.width, imageSize.width) + 2 * placeholder;
                totalHeight = titleSize.height + spacing + imageSize.height + 2 * placeholder;
                
                titleInset = UIEdgeInsetsMake(placeholder, - (imageSize.width - placeholder), 0, 0);
                imageInset = UIEdgeInsetsMake(titleSize.height + spacing + placeholder, (totalWidth - imageSize.width) * 0.5, 0, 0);
            }
            break;
            
            case UIButtonLayoutStyleBottomText: {
                totalWidth = MAX(titleSize.width, imageSize.width) + 2 * placeholder;
                totalHeight = titleSize.height + spacing + imageSize.height + 2 * placeholder;
                
                titleInset = UIEdgeInsetsMake(imageSize.height + spacing + placeholder, - (imageSize.width - placeholder), 0, 0);
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
