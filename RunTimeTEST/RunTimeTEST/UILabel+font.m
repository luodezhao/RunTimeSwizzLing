//
//  UILabel+font.m
//  RunTimeTEST
//
//  Created by YB on 16/1/16.
//  Copyright © 2016年 YB. All rights reserved.
//

#import "UILabel+font.h"

@implementation UILabel (font)
+ (void)load {
    static dispatch_once_t t;
    dispatch_once(&t, ^{
        Class cls = [UILabel class];
        SEL originalSelector = @selector(willMoveToSuperview:);
        SEL swizzledSelector = @selector(myWillMoveToSuperview:);
        Method originalM = class_getInstanceMethod(cls, originalSelector);
        Method swizzedM = class_getInstanceMethod(cls, swizzledSelector);
        Method supperM = class_getInstanceMethod([UIView class], originalSelector);
                        NSLog(@"%p",method_getImplementation(swizzedM));
        NSLog(@"%p",method_getImplementation(originalM));
                NSLog(@"%p",method_getImplementation(supperM));
        BOOL add = class_addMethod(cls, originalSelector, method_getImplementation(swizzedM), method_getTypeEncoding(swizzedM));
        NSLog(@"%p",method_getImplementation(swizzedM));
        NSLog(@"%p",method_getImplementation(originalM));

        if (add) {
            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalM), method_getTypeEncoding(originalM));
                NSLog(@"%p",method_getImplementation(swizzedM));
            NSLog(@"%p",method_getImplementation(originalM));
        }else {
            method_exchangeImplementations(originalM, swizzedM);
        }
    });
}


- (void)setIsSystemColor:(NSString *)isSystemColor{
    objc_setAssociatedObject(self, @selector(isSystemColor), isSystemColor, OBJC_ASSOCIATION_ASSIGN);
    [self willMoveToSuperview:self.superview];
    objc_setAssociatedObject(self, @selector(isSystemColor), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (NSString *)isSystemColor {

    return (NSString *)objc_getAssociatedObject(self, _cmd);

}
- (void)myWillMoveToSuperview:(UIView *)view {
    [self myWillMoveToSuperview:view];
    if (self.isSystemColor) {
            self.backgroundColor = [UIColor redColor];
    }
}
@end
