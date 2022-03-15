//
//  HCDRViewController.h
//  HCDR
//
//  Created by Y on 2020/12/21.
//  Copyright © 2020 Y. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HCDREnvProfile) {
    HCDREnvProfileTest,       // 测试环境
    HCDREnvProfileProduct     // 生产环境
};

NS_ASSUME_NONNULL_BEGIN

@interface HCDRViewController : UIViewController

// 初始化字典 param
// {
//     @"orgCode": @"",    机构代码
//     @"orderId": @"",    订单编号
//     @"productCode": @"" 产品代码
// }
- (instancetype)initWithParam:(NSDictionary *)param;

// 环境变量，默认接入测试环境
@property (nonatomic, assign) HCDREnvProfile envProfile;

// 双录结束回调 responseData
// {
//     @"isSuccess": @"",  1正常结束 0非正常结束
//     @"isOwner": @""     1本人操作 0非本人操作
// }
@property (nonatomic, copy) void (^responseBlock)(id responseData);

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
