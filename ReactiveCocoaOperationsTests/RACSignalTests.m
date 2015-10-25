//
//  RACSignalTests.m
//  ReactiveCocoaCatalog
//
//  Created by leichunfeng on 15/10/14.
//  Copyright © 2015年 leichunfeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

/// RACSignal 类簇（class cluster）
///
/// RACSignal 共有 9 个私有的、具体的子类，它们是：
///
/// RACEmptySignal     遍历数组 √
/// RACReturnSignal    动态序列 √
/// RACDynamicSignal   非懒计算的序列 √
/// RACErrorSignal     空序列 √
/// RACChannelTerminal 遍历索引集 √
/// RACSubject         遍历信号 √
/// RACGroupedSignal   遍历字符串 √
/// RACBehaviorSubject 遍历元组 √
/// RACReplaySubject   一元序列 √
///
/// 继承关系如下：
///
/// * NSObject
/// L * RACStream
///   L * RACSignal
///       L * RACEmptySignal
///       L * RACReturnSignal
///       L * RACDynamicSignal
///       L * RACErrorSignal
///       L * RACChannelTerminal
///       L * RACSubject
///         L * RACGroupedSignal
///         L * RACBehaviorSubject
///         L * RACReplaySubject

@interface RACSignalTests : XCTestCase

@end

@implementation RACSignalTests

#pragma mark - Monad interface

/// RACReturnSignal
- (void)test_return {
    RACSignal *result = [RACSignal return:@"A"];
    XCTAssertTrue(result.toArray.count == 1 && [result.first isEqualToString:@"A"]);
}

/// RACDynamicSignal
- (void)test_bind {
    RACSignal *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    RACSignal *result = [letters bind:^{
        return ^(NSString *letter, BOOL *stop) {
            if ([letter isEqualToString:@"E"]) *stop = YES;
            return [RACSignal return:[letter stringByAppendingString:letter]];
        };
    }];
    
    NSArray *expect = [@"AA BB CC DD EE" componentsSeparatedByString:@" "];
    
    XCTAssertTrue([result.toArray isEqualToArray:expect]);
}

#pragma mark - Empty signal

/// RACEmptySignal
- (void)test_empty {
    RACSignal *result = [RACSignal empty];
    XCTAssertTrue(result.first == nil);
}

#pragma mark - Reducing signals

/// RACDynamicSignal
- (void)test_aggregateWithStart_reduce {
    RACSignal *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    RACSignal *result = [numbers
        aggregateWithStart:@"0"
        reduce:^(NSString *running, NSString *next) {
            return @(running.integerValue + next.integerValue).stringValue;
        }];
    
    XCTAssertTrue([result.first isEqualToString:@"45"]);
}

/// RACDynamicSignal
- (void)test_aggregateWithStart_reduceWithIndex {
    RACSignal *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    RACSignal *result = [numbers
        aggregateWithStart:@"0"
        reduceWithIndex:^(NSString *running, NSString *next, NSUInteger index) {
            return @(running.integerValue + next.integerValue + index).stringValue;
        }];
    
    XCTAssertTrue([result.first isEqualToString:@"81"]);
}

/// RACDynamicSignal
- (void)test_aggregateWithStartFactory_reduce {
    RACSignal *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    RACSignal *result = [numbers aggregateWithStartFactory:^{
        return @"0";
    } reduce:^(NSString *running, NSString *next) {
        return @(running.integerValue + next.integerValue).stringValue;
    }];
    
    XCTAssertTrue([result.first isEqualToString:@"45"]);
}

- (void)concat {
    
}

#pragma mark - Building signals

- (void)test_createSignal {
    RACSignal *result = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"A"];
        [subscriber sendNext:@"B"];
        [subscriber sendNext:@"C"];
        [subscriber sendNext:@"D"];
        [subscriber sendNext:@"E"];
        [subscriber sendNext:@"F"];
        [subscriber sendNext:@"G"];
        [subscriber sendNext:@"H"];
        [subscriber sendNext:@"I"];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{}];
    }];
    
    NSArray *expect = [@"A B C D E F G H I" componentsSeparatedByString:@" "];
    
    XCTAssertTrue([result.toArray isEqualToArray:expect]);
}

- (void)test_error {
    NSError *expect = [NSError errorWithDomain:@"com.leichunfeng.ErrorDomain" code:404 userInfo:nil];
    RACSignal *result = [RACSignal error:expect];
    [result subscribeError:^(NSError *error) {
        XCTAssertTrue([error isEqual:expect]);
    }];
}

/// RACDynamicSignal
- (void)test_scanWithStart_reduce {
    RACSignal *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    RACSignal *result = [numbers
        scanWithStart:@"0"
        reduce:^(NSString *running, NSString *next) {
        	return @(running.integerValue + next.integerValue).stringValue;
        }];
    
    NSArray *expect = [@"1 3 6 10 15 21 28 36 45" componentsSeparatedByString:@" "];
    
    XCTAssertTrue([result.toArray isEqualToArray:expect]);
}

/// RACDynamicSignal
- (void)test_scanWithStart_reduceWithIndex {
    RACSignal *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    RACSignal *result = [numbers
        scanWithStart:@"0"
        reduceWithIndex:^(NSString *running, NSString *next, NSUInteger index) {
        	return @(running.integerValue + next.integerValue + index).stringValue;
        }];
    
    NSArray *expect = [@"1 4 9 16 25 36 49 64 81" componentsSeparatedByString:@" "];
    
    XCTAssertTrue([result.toArray isEqualToArray:expect]);
}

#pragma mark - Generalized functions

- (void)test_groupBy {}

@end
