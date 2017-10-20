//
//  UIView+Events.m
//  corp.bytedance
//
//  Created by zuopengliu on 19/10/2017.
//  Copyright © 2017 com.zuopeng. All rights reserved.
//

#import "UIKits+BDEvents.h"
#import <objc/runtime.h>



#define defineWeakSelf __weak typeof(self) weakSelf = self;


#pragma mark - UIView (BDEventsGesture)

@interface UIView (BDEventsGesture)

/**
 单击手势
 */
@property (nonatomic, strong) UITapGestureRecognizer *bdevent_onClickGesture;

/**
 双击手势
 */
@property (nonatomic, strong) UITapGestureRecognizer *bdevent_onDblClickGesture;

/**
 长按手势
 */
@property (nonatomic, strong) UILongPressGestureRecognizer *bdevent_onLongPressGesture;

/**
 点击回调
 */
@property (nonatomic, copy, nullable) BDEventSelfParamBlock bdevent_onClick;

/**
 双击回调
 */
@property (nonatomic, copy, nullable) BDEventSelfParamBlock bdevent_onDblClick;

/**
 长按回调
 */
@property (nonatomic, copy, nullable) BDEventStateSelfParamBlock bdevent_onLongTouch;

@end

@implementation UIView (BDEventsGesture)

- (void)setBdevent_onClickGesture:(UITapGestureRecognizer *)onClickGestureParam
{
    objc_setAssociatedObject(self, @selector(bdevent_onClickGesture), onClickGestureParam, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITapGestureRecognizer *)bdevent_onClickGesture
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBdevent_onDblClickGesture:(UITapGestureRecognizer *)onDblClickGestureParam
{
    objc_setAssociatedObject(self, @selector(bdevent_onDblClickGesture), onDblClickGestureParam, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITapGestureRecognizer *)bdevent_onDblClickGesture
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBdevent_onLongPressGesture:(UILongPressGestureRecognizer *)onLongPressGestureParam
{
    objc_setAssociatedObject(self, @selector(bdevent_onLongPressGesture), onLongPressGestureParam, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILongPressGestureRecognizer *)bdevent_onLongPressGesture
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBdevent_onClick:(BDEventSelfParamBlock)onClickParam
{
    objc_setAssociatedObject(self, @selector(bdevent_onClick), onClickParam, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BDEventSelfParamBlock)bdevent_onClick
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBdevent_onDblClick:(BDEventSelfParamBlock)onDblClickParam
{
    objc_setAssociatedObject(self, @selector(bdevent_onDblClick), onDblClickParam, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BDEventSelfParamBlock)bdevent_onDblClick
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBdevent_onLongTouch:(BDEventStateSelfParamBlock)onLongTouchParam
{
    objc_setAssociatedObject(self, @selector(bdevent_onLongTouch), onLongTouchParam, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BDEventStateSelfParamBlock)bdevent_onLongTouch
{
    return objc_getAssociatedObject(self, _cmd);
}

@end



#pragma mark - UIView (BDEvents)

@implementation UIView (BDEvents)

- (instancetype)bd_onClick:(BDEventSelfParamBlock)callback
{
    if (!callback) {
        if (self.bdevent_onClickGesture) {
            if ([self.gestureRecognizers containsObject:self.bdevent_onClickGesture]) {
                [self removeGestureRecognizer:self.bdevent_onClickGesture];
            }
            self.bdevent_onClickGesture = nil;
        }
    } else {
        UITapGestureRecognizer *clickGR = self.bdevent_onClickGesture;
        if (!clickGR) {
            defineWeakSelf;
            clickGR = [[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(bdevent_onClickGestureAction:)];
            clickGR.numberOfTapsRequired = 1;
            clickGR.numberOfTouchesRequired = 1;
            self.bdevent_onClickGesture = clickGR;
        }
        [self addGestureRecognizer:clickGR];
    }
    [self bdevent_checkTapGestures];
    
    self.bdevent_onClick = callback;
    
    return self;
}

- (instancetype)bd_onDblClick:(BDEventSelfParamBlock)callback
{
    if (!callback) {
        if (self.bdevent_onDblClickGesture) {
            if ([self.gestureRecognizers containsObject:self.bdevent_onDblClickGesture]) {
                [self removeGestureRecognizer:self.bdevent_onDblClickGesture];
            }
            self.bdevent_onDblClickGesture = nil;
        }
    } else {
        UITapGestureRecognizer *dblClickGR = self.bdevent_onDblClickGesture;
        if (!dblClickGR) {
            defineWeakSelf;
            dblClickGR = [[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(bdevent_onDblClickGestureAction:)];
            dblClickGR.numberOfTapsRequired = 2;
            dblClickGR.numberOfTouchesRequired = 1;
            self.bdevent_onDblClickGesture = dblClickGR;
        }
        [self addGestureRecognizer:dblClickGR];
    }
    [self bdevent_checkTapGestures];
    
    self.bdevent_onDblClick = callback;
    
    return self;
}

- (instancetype)bd_onLongPress:(BDEventStateSelfParamBlock)callback
{
    if (!callback) {
        if (self.bdevent_onLongPressGesture) {
            if ([self.gestureRecognizers containsObject:self.bdevent_onLongPressGesture]) {
                [self removeGestureRecognizer:self.bdevent_onLongPressGesture];
            }
            self.bdevent_onLongPressGesture = nil;
        }
    } else {
        UILongPressGestureRecognizer *longPressGesture = self.bdevent_onLongPressGesture;
        if (!longPressGesture) {
            defineWeakSelf;
            longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(bdevent_onLongPressGestureAction:)];
            self.bdevent_onLongPressGesture = longPressGesture;
        }
        [self addGestureRecognizer:longPressGesture];
    }
    
    self.bdevent_onLongTouch = callback;
    
    return self;
}

#pragma mark - gesture

- (void)bdevent_onClickGestureAction:(UITapGestureRecognizer *)clickGR
{
    if (self.bdevent_onClick) {
        defineWeakSelf;
        self.bdevent_onClick(weakSelf);
    }
}

- (void)bdevent_onDblClickGestureAction:(UITapGestureRecognizer *)dlbClickGR
{
    if (self.bdevent_onDblClick) {
        defineWeakSelf;
        self.bdevent_onDblClick(weakSelf);
    }
}

- (void)bdevent_onLongPressGestureAction:(UILongPressGestureRecognizer *)longPressGR
{
    if (self.bdevent_onLongTouch) {
        defineWeakSelf;
        self.bdevent_onLongTouch(longPressGR.state, weakSelf);
    }
}

#pragma mark - helper

- (void)bdevent_checkTapGestures
{
    if (self.bdevent_onClickGesture && self.bdevent_onDblClickGesture) {
        [self.bdevent_onClickGesture requireGestureRecognizerToFail:self.bdevent_onDblClickGesture];
    }
}

@end



#pragma mark - UIControl (BDEvents)

@implementation UIControl (BDEvents)

- (instancetype)bd_onClick:(BDEventControlEventsSelfParamsBlock)callback
          forControlEvents:(UIControlEvents)controlEvents;
{
    static NSInteger methodIdx = 0;
    NSString *methodName = [NSString stringWithFormat:@"bdevent_buttonBlockMethodName_%ld", (long)methodIdx++];
    SEL methodSEL = sel_registerName([methodName UTF8String]);
    
    defineWeakSelf;
    IMP methodImplement = imp_implementationWithBlock(^{
        if (callback) {
            callback(controlEvents, weakSelf);
        }
    });
    
    BOOL success = class_addMethod([self class], methodSEL, methodImplement, "v@:");
    if (!success) return self;
    
    [self addTarget:weakSelf action:methodSEL forControlEvents:controlEvents];
    
    return self;
}

@end


