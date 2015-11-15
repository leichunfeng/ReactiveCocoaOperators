//
//  TestsHelper.h
//  ReactiveCocoaOperations
//
//  Created by leichunfeng on 15/10/25.
//  Copyright © 2015年 leichunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestsHelper : NSObject

+ (NSArray *)classMethodsInClasses:(NSArray *)classes;
+ (NSArray *)instanceMethodsInClasses:(NSArray *)classes;

@end
