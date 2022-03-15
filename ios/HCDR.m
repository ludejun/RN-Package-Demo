//
//  HCDR.m
//  RNDemo
//
//  Created by Y on 2022/3/14.
//

#import "HCDR.h"
#import "HCDRViewController.h"

@implementation HCDR

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(openDR:(NSDictionary *)data callback:(RCTResponseSenderBlock)callback) {
  NSLog(@"data: %@", data);
  
  UIViewController *parCon = [[UIApplication sharedApplication].delegate window].rootViewController;
  while (1) {
      if (parCon.presentedViewController) {
          parCon = parCon.presentedViewController;
      } else {
          if ([parCon isKindOfClass:[UINavigationController class]]) {
              parCon = ((UINavigationController *)parCon).visibleViewController;
          } else if ([parCon isKindOfClass:[UITabBarController class]]) {
              parCon = ((UITabBarController *)parCon).selectedViewController;
          } else {
              break;
          }
      }
  }
  
  HCDRViewController *con = [[HCDRViewController alloc] initWithParam:data];

  con.envProfile = HCDREnvProfileTest;
  
  con.responseBlock = ^(id responseData) {
    callback(@[responseData]);
  };
  
  con.modalPresentationStyle = UIModalPresentationFullScreen;
  [parCon presentViewController:con animated:YES completion:nil];
}

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

@end
