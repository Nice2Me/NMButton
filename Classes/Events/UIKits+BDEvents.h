//
//  UIKits+BDEvents.h
//  corp.bytedance
//
//  Created by zuopengliu on 19/10/2017.
//  Copyright © 2017 com.zuopeng. All rights reserved.
//

#import <UIKit/UIKit.h>




NS_ASSUME_NONNULL_BEGIN


typedef void (^BDEventSelfParamBlock)(UIView * _Nullable mySelf);

typedef void (^BDEventStateSelfParamBlock)(UIGestureRecognizerState state, UIView * _Nullable mySelf);

typedef void (^BDEventControlEventsSelfParamsBlock)(UIControlEvents events, UIControl * _Nullable mySelf);


/**
 当UIView的alpha = 0、hidden = 1、userInteractionEnabled = NO时，事件将被忽略
 */
@interface UIView (BDEvents)

/**
 为UIView及其子类对象添加或移除单击动作
 
 @param callback 点击回调
 */
- (instancetype)bd_onClick:(BDEventSelfParamBlock _Nullable)callback;

/**
 为UIView及其子类对象添加或移除双击动作
 
 @param callback 双击回调
 */
- (instancetype)bd_onDblClick:(BDEventSelfParamBlock _Nullable)callback;

/**
 为UIView及其子类对象添加或移除长按动作
 
 @param callback 长按回调
 */
- (instancetype)bd_onLongPress:(BDEventStateSelfParamBlock _Nullable)callback;

@end



@interface UIControl (BDEvents)

/**
 为按钮添加各种事件动作
 
 @param callback 按钮动作回调
 @param controlEvents 按钮事件
 */
- (instancetype)bd_onClick:(BDEventControlEventsSelfParamsBlock _Nonnull)callback
          forControlEvents:(UIControlEvents)controlEvents;

@end


NS_ASSUME_NONNULL_END
