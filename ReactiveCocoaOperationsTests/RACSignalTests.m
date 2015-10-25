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
    // × "+ (id)behaviorSubjectWithDefaultValue:(id)arg0 ",
    // √ "+ (id)combineLatest:(id)arg0 reduce:(@?)arg1 ",
    // √ "+ (id)combineLatest:(id)arg0 ",
    // √ "+ (id)concat:(id)arg0 ",
    // √ "+ (id)createSignal:(@?)arg0 ",
    // √ "+ (id)defer:(@?)arg0 ",
    // √ "+ (id)empty",
    // √ "+ (id)error:(id)arg0 ",
    // √ "+ (id)if:(id)arg0 then:(id)arg1 else:(id)arg2 ",
    // × "+ (id)interval:(double)arg0 ",
    // √ "+ (id)interval:(double)arg0 onScheduler:(id)arg1 withLeeway:(double)arg2 ",
    // √ "+ (id)interval:(double)arg0 onScheduler:(id)arg1 ",
    // × "+ (id)interval:(double)arg0 withLeeway:(double)arg1 ",
    // × "+ (id)join:(id)arg0 block:(@?)arg1 ",
    // √ "+ (id)merge:(id)arg0 ",
    // √ "+ (id)never",
    // × "+ (id)replaySubjectWithCapacity:(Q)arg0 ",
    // √ "+ (id)return:(id)arg0 ",
    // × "+ (id)signalWithKey:(id)arg0 ",
    // × "+ (id)start:(@?)arg0 ",
    // √ "+ (id)startEagerlyWithScheduler:(id)arg0 block:(@?)arg1 ",
    // √ "+ (id)startLazilyWithScheduler:(id)arg0 block:(@?)arg1 ",
    // × "+ (id)startWithScheduler:(id)arg0 block:(@?)arg1 ",
    // × "+ (id)startWithScheduler:(id)arg0 subjectBlock:(@?)arg1 ",
    // √ "+ (id)subject",
    // √ "+ (id)switch:(id)arg0 cases:(id)arg1 default:(id)arg2 ",
    // √ "+ (id)zip:(id)arg0 reduce:(@?)arg1 ",
    // √ "+ (id)zip:(id)arg0 "

    NSArray *instanceMethods = [TestsHelper instanceMethodsInClasses:classes];

    NSLog(@"instanceMethods: %@", instanceMethods);

    // 输出如下
    //
    // 1. 打勾的表示是公开的方法，下面有提供相应的测试用例
    // 2. 打叉的表示是私有的方法或者其他不相关的方法
    //
    // √ "- (void).cxx_destruct",
    // √ "- (id)aggregateWithStart:(id)arg0 combine:(@?)arg1 ",
    // √ "- (id)aggregateWithStart:(id)arg0 reduce:(@?)arg1 ",
    // √ "- (id)aggregateWithStart:(id)arg0 reduceWithIndex:(@?)arg1 ",
    // √ "- (id)aggregateWithStartFactory:(@?)arg0 combine:(@?)arg1 ",
    // √ "- (id)aggregateWithStartFactory:(@?)arg0 reduce:(@?)arg1 ",
    // √ "- (id)all:(@?)arg0 ",
    // √ "- (id)and",
    // √ "- (id)any",
    // √ "- (id)any:(@?)arg0 ",
    // √ "- (id)asynchronousFirstOrDefault:(id)arg0 success:(BOOL *)arg1 error:(id *)arg2 ",
    // √ "- (BOOL)asynchronouslyWaitUntilCompleted:(id *)arg0 ",
    // √ "- (id)bind:(@?)arg0 ",
    // √ "- (id)buffer:(Q)arg0 ",
    // √ "- (id)bufferWithTime:(double)arg0 ",
    // √ "- (id)bufferWithTime:(double)arg0 onScheduler:(id)arg1 ",
    // √ "- (Q)capacity",
    // √ "- (id)catch:(@?)arg0 ",
    // √ "- (id)catchTo:(id)arg0 ",
    // √ "- (id)collect",
    // √ "- (id)combineLatestWith:(id)arg0 ",
    // √ "- (id)combinePreviousWithStart:(id)arg0 reduce:(@?)arg1 ",
    // √ "- (id)concat:(id)arg0 ",
    // √ "- (id)concat",
    // √ "- (id)currentValue",
    // √ "- (void)dealloc",
    // √ "- (id)delay:(double)arg0 ",
    // √ "- (id)deliverOn:(id)arg0 ",
    // √ "- (id)deliverOnMainThread",
    // √ "- (id)dematerialize",
    // √ "- (id)description",
    // √ "- (@?)didSubscribe",
    // √ "- (void)didSubscribeWithDisposable:(id)arg0 ",
    // √ "- (id)disposable",
    // √ "- (id)distinctUntilChanged",
    // √ "- (id)doCompleted:(@?)arg0 ",
    // √ "- (id)doError:(@?)arg0 ",
    // √ "- (id)doNext:(@?)arg0 ",
    // √ "- (void)enumerateSubscribersUsingBlock:(@?)arg0 ",
    // √ "- (id)error",
    // √ "- (id)executeCommand:(id)arg0 ",
    // √ "- (id)filter:(@?)arg0 ",
    // √ "- (id)finally:(@?)arg0 ",
    // √ "- (id)first",
    // √ "- (id)firstOrDefault:(id)arg0 ",
    // √ "- (id)firstOrDefault:(id)arg0 success:(BOOL *)arg1 error:(id *)arg2 ",
    // √ "- (id)flatten:(Q)arg0 ",
    // √ "- (id)flatten",
    // √ "- (id)flattenMap:(@?)arg0 ",
    // √ "- (id)groupBy:(@?)arg0 transform:(@?)arg1 ",
    // √ "- (id)groupBy:(@?)arg0 ",
    // √ "- (BOOL)hasCompleted",
    // √ "- (BOOL)hasError",
    // √ "- (id)ignore:(id)arg0 ",
    // √ "- (id)ignoreElements",
    // √ "- (id)ignoreValues",
    // √ "- (id)init",
    // √ "- (id)initWithCapacity:(Q)arg0 ",
    // √ "- (id)initWithValues:(id)arg0 otherTerminal:(id)arg1 ",
    // √ "- (id)initially:(@?)arg0 ",
    // √ "- (id)key",
    // √ "- (id)let:(@?)arg0 ",
    // √ "- (id)logAll",
    // √ "- (id)logCompleted",
    // √ "- (id)logError",
    // √ "- (id)logNext",
    // √ "- (id)map:(@?)arg0 ",
    // √ "- (id)mapPreviousWithStart:(id)arg0 reduce:(@?)arg1 ",
    // √ "- (id)mapReplace:(id)arg0 ",
    // √ "- (id)materialize",
    // √ "- (id)merge:(id)arg0 ",
    // √ "- (id)multicast:(id)arg0 ",
    // √ "- (id)name",
    // √ "- (id)not",
    // √ "- (id)or",
    // √ "- (id)otherTerminal",
    // √ "- (id)publish",
    // √ "- (id)reduceApply",
    // √ "- (id)reduceEach:(@?)arg0 ",
    // √ "- (id)repeat",
    // √ "- (id)replay",
    // √ "- (id)replayLast",
    // √ "- (id)replayLazily",
    // √ "- (id)retry",
    // √ "- (id)retry:(q)arg0 ",
    // √ "- (id)sample:(id)arg0 ",
    // √ "- (id)scanWithStart:(id)arg0 combine:(@?)arg1 ",
    // √ "- (id)scanWithStart:(id)arg0 reduce:(@?)arg1 ",
    // √ "- (id)scanWithStart:(id)arg0 reduceWithIndex:(@?)arg1 ",
    // √ "- (void)sendCompleted",
    // √ "- (void)sendError:(id)arg0 ",
    // √ "- (void)sendNext:(id)arg0 ",
    // √ "- (id)sequence",
    // √ "- (id)sequenceMany:(@?)arg0 ",
    // √ "- (id)sequenceNext:(@?)arg0 ",
    // √ "- (void)setCurrentValue:(id)arg0 ",
    // √ "- (void)setError:(id)arg0 ",
    // √ "- (void)setHasCompleted:(BOOL)arg0 ",
    // √ "- (void)setHasError:(BOOL)arg0 ",
    // √ "- (void)setKey:(id)arg0 ",
    // √ "- (id)setKeyPath:(id)arg0 onObject:(id)arg1 nilValue:(id)arg2 ",
    // √ "- (id)setKeyPath:(id)arg0 onObject:(id)arg1 ",
    // √ "- (void)setName:(id)arg0 ",
    // √ "- (id)setNameWithFormat:(id)arg0 ",
    // √ "- (id)skip:(Q)arg0 ",
    // √ "- (id)skipUntilBlock:(@?)arg0 ",
    // √ "- (id)skipWhileBlock:(@?)arg0 ",
    // √ "- (id)startWith:(id)arg0 ",
    // √ "- (id)subscribe:(id)arg0 ",
    // √ "- (id)subscribeCompleted:(@?)arg0 ",
    // √ "- (id)subscribeError:(@?)arg0 completed:(@?)arg1 ",
    // √ "- (id)subscribeError:(@?)arg0 ",
    // √ "- (id)subscribeNext:(@?)arg0 ",
    // √ "- (id)subscribeNext:(@?)arg0 completed:(@?)arg1 ",
    // √ "- (id)subscribeNext:(@?)arg0 error:(@?)arg1 completed:(@?)arg2 ",
    // √ "- (id)subscribeNext:(@?)arg0 error:(@?)arg1 ",
    // √ "- (id)subscribeOn:(id)arg0 ",
    // √ "- (id)subscribers",
    // √ "- (id)switchToLatest",
    // √ "- (id)take:(Q)arg0 ",
    // √ "- (id)takeLast:(Q)arg0 ",
    // √ "- (id)takeUntil:(id)arg0 ",
    // √ "- (id)takeUntilBlock:(@?)arg0 ",
    // √ "- (id)takeUntilReplacement:(id)arg0 ",
    // √ "- (id)takeWhileBlock:(@?)arg0 ",
    // √ "- (id)then:(@?)arg0 ",
    // √ "- (id)throttle:(double)arg0 valuesPassingTest:(@?)arg1 ",
    // √ "- (id)throttle:(double)arg0 ",
    // √ "- (id)timeout:(double)arg0 ",
    // √ "- (id)timeout:(double)arg0 onScheduler:(id)arg1 ",
    // √ "- (id)toArray",
    // √ "- (id)toProperty:(id)arg0 onObject:(id)arg1 ",
    // √ "- (id)try:(@?)arg0 ",
    // √ "- (id)tryMap:(@?)arg0 ",
    // √ "- (id)value",
    // √ "- (id)values",
    // √ "- (id)valuesReceived",
    // √ "- (BOOL)waitUntilCompleted:(id *)arg0 ",
    // √ "- (id)windowWithStart:(id)arg0 close:(@?)arg1 ",
    // √ "- (id)zipWith:(id)arg0 "
}

#pragma mark - Class methods

- (void)testClassMethod_combineLatest_reduce {
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];

    RACSignal *result = [RACSignal
        combineLatest:@[ letters, numbers ]
      	reduce:^(NSString *letter, NSString *number) {
            return [letter stringByAppendingString:number];
        }];

    // 输出：E1 E2 E3 E4 E5 E6 E7 E8 E9 F9 G9 H9 I9
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];

    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [letters sendNext:@"C"];
    [letters sendNext:@"D"];
    [letters sendNext:@"E"];

    [numbers sendNext:@"1"];
    [numbers sendNext:@"2"];
    [numbers sendNext:@"3"];
    [numbers sendNext:@"4"];
    [numbers sendNext:@"5"];
    [numbers sendNext:@"6"];
    [numbers sendNext:@"7"];
    [numbers sendNext:@"8"];
    [numbers sendNext:@"9"];
    [numbers sendCompleted];

    [letters sendNext:@"F"];
    [letters sendNext:@"G"];
    [letters sendNext:@"H"];
    [letters sendNext:@"I"];
    [letters sendCompleted];
}

- (void)testClassMethod_combineLatest {
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];

    RACSignal *result = [RACSignal combineLatest:@[ letters, numbers ]];

    // 输出：(E,1) (E,2) (E,3) (E,4) (E,5) (E,6) (E,7) (E,8) (E,9) (F,9) (G,9) (H,9) (I,9)
    [result subscribeNext:^(RACTuple *tuple) {
        NSLog(@"(%@,%@)", tuple.first, tuple.second);
    }];

    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [letters sendNext:@"C"];
    [letters sendNext:@"D"];
    [letters sendNext:@"E"];

    [numbers sendNext:@"1"];
    [numbers sendNext:@"2"];
    [numbers sendNext:@"3"];
    [numbers sendNext:@"4"];
    [numbers sendNext:@"5"];
    [numbers sendNext:@"6"];
    [numbers sendNext:@"7"];
    [numbers sendNext:@"8"];
    [numbers sendNext:@"9"];
    [numbers sendCompleted];

    [letters sendNext:@"F"];
    [letters sendNext:@"G"];
    [letters sendNext:@"H"];
    [letters sendNext:@"I"];
    [letters sendCompleted];
}

- (void)testClassMethod_concat {
    RACSignal *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    RACSignal *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;

    RACSignal *result = [RACSignal concat:@[ letters, numbers ]];

    // 输出：A B C D E F G H I 1 2 3 4 5 6 7 8 9
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)testClassMethod_createSignal {
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

    // 输出：A B C D E F G H I
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)testClassMethod_defer {
    RACSignal *result = [RACSignal defer:^{
        return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
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
    }];

    // 输出：A B C D E F G H I
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)testClassMethod_empty {
    RACSignal *result = [RACSignal empty];

    // 输出：空
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)testClassMethod_error {
    NSError *error = [NSError errorWithDomain:@"com.leichunfeng.ErrorDomain" code:404 userInfo:nil];
    RACSignal *result = [RACSignal error:error];

    // 输出：404
    [result subscribeError:^(NSError *error) {
        NSLog(@"%@", @(error.code));
    }];
}

- (void)testClassMethod_if_then_else {
    RACSubject *boolSignal  = [RACSubject subject];
    RACSubject *trueSignal  = [RACSubject subject];
    RACSubject *falseSignal = [RACSubject subject];

    // 输出：A B C D E 6 7 8 9
    [[RACSignal
		if:boolSignal
		then:trueSignal
     	else:falseSignal]
        subscribeNext:^(id x) {
            NSLog(@"%@", x);
        }];

    [boolSignal sendNext:@YES];

    [trueSignal sendNext:@"A"];
    [trueSignal sendNext:@"B"];
    [trueSignal sendNext:@"C"];
    [trueSignal sendNext:@"D"];
    [trueSignal sendNext:@"E"];

    [falseSignal sendNext:@"1"];
    [falseSignal sendNext:@"2"];
    [falseSignal sendNext:@"3"];
    [falseSignal sendNext:@"4"];
    [falseSignal sendNext:@"5"];

    [boolSignal sendNext:@NO];
    [boolSignal sendCompleted];

    [trueSignal sendNext:@"F"];
    [trueSignal sendNext:@"G"];
    [trueSignal sendNext:@"H"];
    [trueSignal sendNext:@"I"];
    [trueSignal sendCompleted];

    [falseSignal sendNext:@"6"];
    [falseSignal sendNext:@"7"];
    [falseSignal sendNext:@"8"];
    [falseSignal sendNext:@"9"];
    [falseSignal sendCompleted];
}

- (void)testClassMethod_interval_onScheduler_withLeeway {
    RACSignal *result = [[RACSignal
        interval:1.0
        onScheduler:[RACScheduler scheduler]
        withLeeway:0.0]
    	take:9];

    __block NSUInteger count = 0;

    // 输出：1 2 3 4 5 6 7 8 9
    [result subscribeNext:^(id x) {
        NSLog(@"%@", @(++count));
    }];

    [result waitUntilCompleted:nil];
}

- (void)testClassMethod_interval_onScheduler {
    RACSignal *result = [[RACSignal
        interval:1.0
        onScheduler:[RACScheduler scheduler]]
    	take:9];

    __block NSUInteger count = 0;

    // 输出：1 2 3 4 5 6 7 8 9
    [result subscribeNext:^(id x) {
        NSLog(@"%@", @(++count));
    }];

    [result waitUntilCompleted:nil];
}

- (void)testClassMethod_merge {
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];

    RACSignal *signalOfSignals = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        [subscriber sendNext:letters];
        [subscriber sendNext:numbers];
        [subscriber sendCompleted];

        return [RACDisposable disposableWithBlock:^{}];
    }];

    RACSignal *result = [signalOfSignals flatten];

    // 输出：A 1 B 2 C 3 D 4 E 5 F 6 G 7 H 8 I 9
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];

    [letters sendNext:@"A"];
    [numbers sendNext:@"1"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"2"];
    [letters sendNext:@"C"];
    [numbers sendNext:@"3"];
    [letters sendNext:@"D"];
    [numbers sendNext:@"4"];
    [letters sendNext:@"E"];
    [numbers sendNext:@"5"];
    [letters sendNext:@"F"];
    [numbers sendNext:@"6"];
    [letters sendNext:@"G"];
    [numbers sendNext:@"7"];
    [letters sendNext:@"H"];
    [numbers sendNext:@"8"];
    [letters sendNext:@"I"];
    [numbers sendNext:@"9"];
    [letters sendCompleted];
    [numbers sendCompleted];
}

- (void)testClassMethod_never {
    RACSignal *result = [RACSignal never];

    // 输出：空
    [result subscribeCompleted:^{
        NSLog(@"subscribeCompleted");
    }];
}

- (void)testClassMethod_return {
    RACSignal *result = [RACSignal return:@"A"];

    // 输出：A
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)testClassMethod_startEagerlyWithScheduler_block {
    RACSignal *result = [RACSignal
        startEagerlyWithScheduler:[RACScheduler scheduler]
        block:^(id<RACSubscriber> subscriber) {
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
        }];

    // 输出：A B C D E F G H I
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)testClassMethod_startLazilyWithScheduler_block {
    RACSignal *result = [RACSignal
        startLazilyWithScheduler:[RACScheduler scheduler]
        block:^(id<RACSubscriber> subscriber) {
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
        }];

    // 输出：A B C D E F G H I
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)testClassMethod_subject {
    RACSubject *letters = [RACSubject subject];

    // 输出：A B C D E F G H I
    [letters subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];

    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [letters sendNext:@"C"];
    [letters sendNext:@"D"];
    [letters sendNext:@"E"];
    [letters sendNext:@"F"];
    [letters sendNext:@"G"];
    [letters sendNext:@"H"];
    [letters sendNext:@"I"];
    [letters sendCompleted];
}

- (void)testClassMethod_switch_cases_default {
    RACSubject *switchSignal = [RACSubject subject];

    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];

    NSDictionary *cases = @{
    	@"letters": letters,
        @"numbers": numbers
    };

    RACSignal *defaultSignal = [RACSignal return:@"X"];

    RACSignal *result = [RACSignal
        switch:switchSignal
        cases:cases
        default:defaultSignal];

    // 输出：A B C D X 6 7 8 9
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];

    [switchSignal sendNext:@"letters"];

    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [letters sendNext:@"C"];
    [letters sendNext:@"D"];

    [numbers sendNext:@"1"];
    [numbers sendNext:@"2"];
    [numbers sendNext:@"3"];
    [numbers sendNext:@"4"];

    [switchSignal sendNext:@"underline"];

    [letters sendNext:@"E"];
    [numbers sendNext:@"5"];

    [switchSignal sendNext:@"numbers"];
    [switchSignal sendCompleted];

    [letters sendNext:@"F"];
    [letters sendNext:@"G"];
    [letters sendNext:@"H"];
    [letters sendNext:@"I"];
    [letters sendCompleted];

    [numbers sendNext:@"6"];
    [numbers sendNext:@"7"];
    [numbers sendNext:@"8"];
    [numbers sendNext:@"9"];
    [numbers sendCompleted];
}

- (void)testClassMethod_zip_reduce {
    RACSignal *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    RACSignal *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;

    RACSignal *result = [RACSignal
        zip:@[ letters, numbers ]
        reduce:^(NSString *letter, NSString *number) {
            return [letter stringByAppendingString:number];
        }];

    // 输出：A1 B2 C3 D4 E5 F6 G7 H8 I9
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)testClassMethod_zip {
    RACSignal *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    RACSignal *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;

    RACSignal *result = [RACSignal zip:@[ letters, numbers ]];

    // 输出：(A,1) (B,2) (C,3) (D,4) (E,5) (F,6) (G,7) (H,8) (I,9)
    [result subscribeNext:^(RACTuple *tuple) {
        NSLog(@"(%@,%@)", tuple.first, tuple.second);
    }];
}

#pragma mark - Instance methods

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

#pragma mark - Building signals

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

@end
