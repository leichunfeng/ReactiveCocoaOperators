//
//  RACSignalTests.m
//  ReactiveCocoaCatalog
//
//  Created by leichunfeng on 15/10/14.
//  Copyright © 2015年 leichunfeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "TestsHelper.h"

/// RACSignal 类簇（class cluster）
///
/// RACSignal 共有 9 个私有的、具体的子类，它们是：
///
/// RACEmptySignal     空信号
/// RACReturnSignal    一元信号
/// RACDynamicSignal   动态信号
/// RACErrorSignal     错误信号
/// RACChannelTerminal 通道终端
/// RACSubject         可变信号
/// RACGroupedSignal   分组信号
/// RACBehaviorSubject 重演最后值的信号
/// RACReplaySubject   重演信号
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

#pragma mark - Find out all methods

- (void)testFindOutAllMethods {
    NSArray *classes = @[
        @"RACStream",
        @"RACSignal",
        @"RACChannelTerminal",
        @"RACSubject",
        @"RACReplaySubject",
        @"RACGroupedSignal",
        @"RACBehaviorSubject",
        @"RACEmptySignal",
        @"RACReturnSignal",
        @"RACDynamicSignal",
        @"RACErrorSignal",
    ];

    NSArray *classMethods = [TestsHelper classMethodsInClasses:classes];

    NSLog(@"classMethods: %@", classMethods);

    // 输出如下
    //
    // 1. 打勾的表示是公开的方法，下面有提供相应的测试用例
    // 2. 打叉的表示是私有的方法或者其他不相关的方法
    //
    // "+ (id)behaviorSubjectWithDefaultValue:(id)arg0 ",
    // "+ (id)combineLatest:(id)arg0 reduce:(@?)arg1 ",
    // "+ (id)combineLatest:(id)arg0 ",
    // "+ (id)concat:(id)arg0 ",
    // "+ (id)createSignal:(@?)arg0 ",
    // "+ (id)defer:(@?)arg0 ",
    // "+ (id)empty",
    // "+ (id)error:(id)arg0 ",
    // "+ (id)if:(id)arg0 then:(id)arg1 else:(id)arg2 ",
    // "+ (id)interval:(double)arg0 ",
    // "+ (id)interval:(double)arg0 onScheduler:(id)arg1 withLeeway:(double)arg2 ",
    // "+ (id)interval:(double)arg0 onScheduler:(id)arg1 ",
    // "+ (id)interval:(double)arg0 withLeeway:(double)arg1 ",
    // "+ (id)join:(id)arg0 block:(@?)arg1 ",
    // "+ (id)merge:(id)arg0 ",
    // "+ (id)never",
    // "+ (id)replaySubjectWithCapacity:(Q)arg0 ",
    // "+ (id)return:(id)arg0 ",
    // "+ (id)signalWithKey:(id)arg0 ",
    // "+ (id)start:(@?)arg0 ",
    // "+ (id)startEagerlyWithScheduler:(id)arg0 block:(@?)arg1 ",
    // "+ (id)startLazilyWithScheduler:(id)arg0 block:(@?)arg1 ",
    // "+ (id)startWithScheduler:(id)arg0 block:(@?)arg1 ",
    // "+ (id)startWithScheduler:(id)arg0 subjectBlock:(@?)arg1 ",
    // "+ (id)subject",
    // "+ (id)switch:(id)arg0 cases:(id)arg1 default:(id)arg2 ",
    // "+ (id)zip:(id)arg0 reduce:(@?)arg1 ",
    // "+ (id)zip:(id)arg0 "

    NSArray *instanceMethods = [TestsHelper instanceMethodsInClasses:classes];

    NSLog(@"instanceMethods: %@", instanceMethods);

    // 输出如下
    //
    // 1. 打勾的表示是公开的方法，下面有提供相应的测试用例
    // 2. 打叉的表示是私有的方法或者其他不相关的方法
    //
    // "- (void).cxx_destruct",
    // "- (id)aggregateWithStart:(id)arg0 combine:(@?)arg1 ",
    // "- (id)aggregateWithStart:(id)arg0 reduce:(@?)arg1 ",
    // "- (id)aggregateWithStart:(id)arg0 reduceWithIndex:(@?)arg1 ",
    // "- (id)aggregateWithStartFactory:(@?)arg0 combine:(@?)arg1 ",
    // "- (id)aggregateWithStartFactory:(@?)arg0 reduce:(@?)arg1 ",
    // "- (id)all:(@?)arg0 ",
    // "- (id)and",
    // "- (id)any",
    // "- (id)any:(@?)arg0 ",
    // "- (id)asynchronousFirstOrDefault:(id)arg0 success:(BOOL *)arg1 error:(id *)arg2 ",
    // "- (BOOL)asynchronouslyWaitUntilCompleted:(id *)arg0 ",
    // "- (id)bind:(@?)arg0 ",
    // "- (id)buffer:(Q)arg0 ",
    // "- (id)bufferWithTime:(double)arg0 ",
    // "- (id)bufferWithTime:(double)arg0 onScheduler:(id)arg1 ",
    // "- (Q)capacity",
    // "- (id)catch:(@?)arg0 ",
    // "- (id)catchTo:(id)arg0 ",
    // "- (id)collect",
    // "- (id)combineLatestWith:(id)arg0 ",
    // "- (id)combinePreviousWithStart:(id)arg0 reduce:(@?)arg1 ",
    // "- (id)concat:(id)arg0 ",
    // "- (id)concat",
    // "- (id)currentValue",
    // "- (void)dealloc",
    // "- (id)delay:(double)arg0 ",
    // "- (id)deliverOn:(id)arg0 ",
    // "- (id)deliverOnMainThread",
    // "- (id)dematerialize",
    // "- (id)description",
    // "- (@?)didSubscribe",
    // "- (void)didSubscribeWithDisposable:(id)arg0 ",
    // "- (id)disposable",
    // "- (id)distinctUntilChanged",
    // "- (id)doCompleted:(@?)arg0 ",
    // "- (id)doError:(@?)arg0 ",
    // "- (id)doNext:(@?)arg0 ",
    // "- (void)enumerateSubscribersUsingBlock:(@?)arg0 ",
    // "- (id)error",
    // "- (id)executeCommand:(id)arg0 ",
    // "- (id)filter:(@?)arg0 ",
    // "- (id)finally:(@?)arg0 ",
    // "- (id)first",
    // "- (id)firstOrDefault:(id)arg0 ",
    // "- (id)firstOrDefault:(id)arg0 success:(BOOL *)arg1 error:(id *)arg2 ",
    // "- (id)flatten:(Q)arg0 ",
    // "- (id)flatten",
    // "- (id)flattenMap:(@?)arg0 ",
    // "- (id)groupBy:(@?)arg0 transform:(@?)arg1 ",
    // "- (id)groupBy:(@?)arg0 ",
    // "- (BOOL)hasCompleted",
    // "- (BOOL)hasError",
    // "- (id)ignore:(id)arg0 ",
    // "- (id)ignoreElements",
    // "- (id)ignoreValues",
    // "- (id)init",
    // "- (id)initWithCapacity:(Q)arg0 ",
    // "- (id)initWithValues:(id)arg0 otherTerminal:(id)arg1 ",
    // "- (id)initially:(@?)arg0 ",
    // "- (id)key",
    // "- (id)let:(@?)arg0 ",
    // "- (id)logAll",
    // "- (id)logCompleted",
    // "- (id)logError",
    // "- (id)logNext",
    // "- (id)map:(@?)arg0 ",
    // "- (id)mapPreviousWithStart:(id)arg0 reduce:(@?)arg1 ",
    // "- (id)mapReplace:(id)arg0 ",
    // "- (id)materialize",
    // "- (id)merge:(id)arg0 ",
    // "- (id)multicast:(id)arg0 ",
    // "- (id)name",
    // "- (id)not",
    // "- (id)or",
    // "- (id)otherTerminal",
    // "- (id)publish",
    // "- (id)reduceApply",
    // "- (id)reduceEach:(@?)arg0 ",
    // "- (id)repeat",
    // "- (id)replay",
    // "- (id)replayLast",
    // "- (id)replayLazily",
    // "- (id)retry",
    // "- (id)retry:(q)arg0 ",
    // "- (id)sample:(id)arg0 ",
    // "- (id)scanWithStart:(id)arg0 combine:(@?)arg1 ",
    // "- (id)scanWithStart:(id)arg0 reduce:(@?)arg1 ",
    // "- (id)scanWithStart:(id)arg0 reduceWithIndex:(@?)arg1 ",
    // "- (void)sendCompleted",
    // "- (void)sendError:(id)arg0 ",
    // "- (void)sendNext:(id)arg0 ",
    // "- (id)sequence",
    // "- (id)sequenceMany:(@?)arg0 ",
    // "- (id)sequenceNext:(@?)arg0 ",
    // "- (void)setCurrentValue:(id)arg0 ",
    // "- (void)setError:(id)arg0 ",
    // "- (void)setHasCompleted:(BOOL)arg0 ",
    // "- (void)setHasError:(BOOL)arg0 ",
    // "- (void)setKey:(id)arg0 ",
    // "- (id)setKeyPath:(id)arg0 onObject:(id)arg1 nilValue:(id)arg2 ",
    // "- (id)setKeyPath:(id)arg0 onObject:(id)arg1 ",
    // "- (void)setName:(id)arg0 ",
    // "- (id)setNameWithFormat:(id)arg0 ",
    // "- (id)skip:(Q)arg0 ",
    // "- (id)skipUntilBlock:(@?)arg0 ",
    // "- (id)skipWhileBlock:(@?)arg0 ",
    // "- (id)startWith:(id)arg0 ",
    // "- (id)subscribe:(id)arg0 ",
    // "- (id)subscribeCompleted:(@?)arg0 ",
    // "- (id)subscribeError:(@?)arg0 completed:(@?)arg1 ",
    // "- (id)subscribeError:(@?)arg0 ",
    // "- (id)subscribeNext:(@?)arg0 ",
    // "- (id)subscribeNext:(@?)arg0 completed:(@?)arg1 ",
    // "- (id)subscribeNext:(@?)arg0 error:(@?)arg1 completed:(@?)arg2 ",
    // "- (id)subscribeNext:(@?)arg0 error:(@?)arg1 ",
    // "- (id)subscribeOn:(id)arg0 ",
    // "- (id)subscribers",
    // "- (id)switchToLatest",
    // "- (id)take:(Q)arg0 ",
    // "- (id)takeLast:(Q)arg0 ",
    // "- (id)takeUntil:(id)arg0 ",
    // "- (id)takeUntilBlock:(@?)arg0 ",
    // "- (id)takeUntilReplacement:(id)arg0 ",
    // "- (id)takeWhileBlock:(@?)arg0 ",
    // "- (id)then:(@?)arg0 ",
    // "- (id)throttle:(double)arg0 valuesPassingTest:(@?)arg1 ",
    // "- (id)throttle:(double)arg0 ",
    // "- (id)timeout:(double)arg0 ",
    // "- (id)timeout:(double)arg0 onScheduler:(id)arg1 ",
    // "- (id)toArray",
    // "- (id)toProperty:(id)arg0 onObject:(id)arg1 ",
    // "- (id)try:(@?)arg0 ",
    // "- (id)tryMap:(@?)arg0 ",
    // "- (id)value",
    // "- (id)values",
    // "- (id)valuesReceived",
    // "- (BOOL)waitUntilCompleted:(id *)arg0 ",
    // "- (id)windowWithStart:(id)arg0 close:(@?)arg1 ",
    // "- (id)zipWith:(id)arg0 "
}

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
