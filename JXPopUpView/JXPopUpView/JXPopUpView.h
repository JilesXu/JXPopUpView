//
//  JXPopUpView.h
//  JXPopUpView
//
//  Created by 徐沈俊杰 on 2018/12/25.
//  Copyright © 2018 JX. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 JXPopUpView 初始化时需占整屏的frame
 */
NS_ASSUME_NONNULL_BEGIN

@interface JXPopUpView : UIView

- (void)showPopUpViewOnSuperView:(UIView *)superView;

- (void)removePopUpView;

@end

NS_ASSUME_NONNULL_END
