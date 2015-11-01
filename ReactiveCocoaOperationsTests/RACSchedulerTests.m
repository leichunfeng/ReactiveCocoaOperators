//
//  RACSchedulerTests.m
//  ReactiveCocoaOperations
//
//  Created by leichunfeng on 15/11/1.
//  Copyright © 2015年 leichunfeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestsHelper.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACSchedulerTests : XCTestCase

@end

@implementation RACSchedulerTests

#pragma mark - Find out all methods

- (void)testFindOutAllMethods {
    NSArray *classes = @[
        @"RACScheduler",
        @"RACImmediateScheduler",
        @"RACQueueScheduler",
        @"RACTargetQueueScheduler",
        @"RACSubscriptionScheduler",
    ];

    NSArray *classMethods = [TestsHelper classMethodsInClasses:classes];

    NSLog(@"classMethods: %@", classMethods);

    // 输出如下
    //
    // 1. 打勾的表示是公开的方法，下面有提供相应的测试用例
    // 2. 打叉的表示是私有的方法或者其他不相关的方法
    //
    // √ "+ (id)currentScheduler",
    // √ "+ (id)immediateScheduler",
    // × "+ (BOOL)isOnMainThread",
    // √ "+ (id)mainThreadScheduler",
    // √ "+ (id)scheduler",
    // √ "+ (id)schedulerWithPriority:(q)arg0 ",
    // √ "+ (id)schedulerWithPriority:(q)arg0 name:(id)arg1 ",
    // × "+ (id)schedulerWithQueue:(id)arg0 name:(id)arg1 ",
    // × "+ (id)subscriptionScheduler",
    // × "+ (Q)wallTimeWithDate:(id)arg0 "

    NSArray *instanceMethods = [TestsHelper instanceMethodsInClasses:classes];

    NSLog(@"instanceMethods: %@", instanceMethods);

    // 输出如下
    //
    // 1. 打勾的表示是公开的方法，下面有提供相应的测试用例
    // 2. 打叉的表示是私有的方法或者其他不相关的方法
    //
    // × "- (void).cxx_destruct",
    // √ "- (id)after:(id)arg0 repeatingEvery:(double)arg1 withLeeway:(double)arg2 schedule:(@?)arg3 ",
    // √ "- (id)after:(id)arg0 schedule:(@?)arg1 ",
    // √ "- (id)afterDelay:(double)arg0 schedule:(@?)arg1 ",
    // × "- (id)backgroundScheduler",
    // × "- (id)description",
    // × "- (id)init",
    // × "- (id)initWithName:(id)arg0 queue:(id)arg1 ",
    // × "- (id)initWithName:(id)arg0 targetQueue:(id)arg1 ",
    // × "- (id)initWithName:(id)arg0 ",
    // × "- (id)name",
    // √ "- (void)performAsCurrentScheduler:(@?)arg0 ",
    // × "- (id)queue",
    // √ "- (id)schedule:(@?)arg0 ",
    // √ "- (id)scheduleRecursiveBlock:(@?)arg0 ",
    // × "- (void)scheduleRecursiveBlock:(@?)arg0 addingToDisposable:(id)arg1 "
}

#pragma mark - Class methods

- (void)testClassMethod_currentScheduler {
    RACScheduler *result = [RACScheduler currentScheduler];
    // 输出：<RACTargetQueueScheduler: 0x7fec8053ac20> com.ReactiveCocoa.RACScheduler.mainThreadScheduler
    NSLog(@"%@", result);
}

- (void)testClassMethod_immediateScheduler {
    RACScheduler *result = [RACScheduler immediateScheduler];
    // 输出：<RACImmediateScheduler: 0x7fcd7240c080> com.ReactiveCocoa.RACScheduler.immediateScheduler
    NSLog(@"%@", result);
}

- (void)testClassMethod_mainThreadScheduler {
    RACScheduler *result = [RACScheduler mainThreadScheduler];
    // 输出：<RACTargetQueueScheduler: 0x7f80d484cb70> com.ReactiveCocoa.RACScheduler.mainThreadScheduler
    NSLog(@"%@", result);
}

- (void)testClassMethod_scheduler {
    RACScheduler *result = [RACScheduler scheduler];
    // 输出：<RACTargetQueueScheduler: 0x7fc5836501c0> com.ReactiveCocoa.RACScheduler.backgroundScheduler
    NSLog(@"%@", result);
}

- (void)testClassMethod_schedulerWithPriority {
    RACScheduler *result = [RACScheduler schedulerWithPriority:RACSchedulerPriorityDefault];
    // 输出：<RACTargetQueueScheduler: 0x7fed4d248720> com.ReactiveCocoa.RACScheduler.backgroundScheduler
    NSLog(@"%@", result);
}

- (void)testClassMethod_schedulerWithPriority_name {
    RACScheduler *result = [RACScheduler schedulerWithPriority:RACSchedulerPriorityDefault name:@"com.ReactiveCocoa.RACScheduler.name"];
    // 输出：<RACTargetQueueScheduler: 0x7faabaf01420> com.ReactiveCocoa.RACScheduler.name
    NSLog(@"%@", result);
}

#pragma mark - Instance methods

- (void)testInstanceMethod_after_repeatingEvery_withLeeway_schedule {
    RACSignal *result = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        RACScheduler *scheduler = [RACScheduler scheduler];
		
        return [scheduler after:[NSDate dateWithTimeIntervalSinceNow:1.0] repeatingEvery:1.0 withLeeway:0.0 schedule:^{
            [subscriber sendNext:[NSDate date]];
        }];
    }];

    result = [result take:3];

    // 输出：
    // 2015-11-01 06:58:03 +0000
    // 2015-11-01 06:58:04 +0000
    // 2015-11-01 06:58:05 +0000
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];

    [result waitUntilCompleted:nil];
}

- (void)testInstanceMethod_after_schedule {
    RACSignal *result = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        RACScheduler *scheduler = [RACScheduler scheduler];
		
        return [scheduler after:[NSDate dateWithTimeIntervalSinceNow:1.0] schedule:^{
            [subscriber sendNext:[NSDate date]];
            [subscriber sendCompleted];
        }];
    }];

    // 输出：
    // 2015-11-01 07:19:14 +0000
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];

    [result waitUntilCompleted:nil];
}

- (void)testInstanceMethod_afterDelay_schedule {
    RACSignal *result = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        RACScheduler *scheduler = [RACScheduler scheduler];
		
        return [scheduler afterDelay:1.0 schedule:^{
            [subscriber sendNext:[NSDate date]];
            [subscriber sendCompleted];
        }];
    }];

    // 输出：
    // 2015-11-01 07:20:33 +0000
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];

    [result waitUntilCompleted:nil];
}

- (void)testInstanceMethod_performAsCurrentScheduler {
    RACSignal *result = [RACSignal createSignal:^ RACDisposable * (id<RACSubscriber> subscriber) {
        RACScheduler *scheduler = [RACScheduler scheduler];
        
        [scheduler performAsCurrentScheduler:^{
            [subscriber sendNext:@"A"];
            [subscriber sendNext:@"B"];
            [subscriber sendNext:@"C"];
            [subscriber sendCompleted];
        }];

        return nil;
    }];

    // 输出：A B C
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)testInstanceMethod_schedule {
    RACSignal *result = [RACSignal createSignal:^ RACDisposable * (id<RACSubscriber> subscriber) {
        RACScheduler *scheduler = [RACScheduler scheduler];
        
        [scheduler schedule:^{
            [subscriber sendNext:@"A"];
            [subscriber sendNext:@"B"];
            [subscriber sendNext:@"C"];
            [subscriber sendCompleted];
        }];

        return nil;
    }];

    // 输出：A B C
    [result subscribeNext:^(id x) {
//        NSLog(@"%@", x);
    }];
}

- (void)testInstanceMethod_scheduleRecursiveBlock {
    RACSignal *result = [RACSignal createSignal:^ RACDisposable * (id<RACSubscriber> subscriber) {
        RACScheduler *scheduler = [RACScheduler scheduler];

        return [scheduler scheduleRecursiveBlock:^(void (^reschedule)(void)) {
            [subscriber sendNext:@"A"];
            reschedule();
        }];
    }];
    
    result = [result take:3];

    // 输出：A A A
    [result subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

@end
