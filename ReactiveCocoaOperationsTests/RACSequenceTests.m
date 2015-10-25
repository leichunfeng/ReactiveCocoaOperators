//
//  RACSequenceTests.m
//  ReactiveCocoaPlayground
//
//  Created by leichunfeng on 15/10/3.
//  Copyright © 2015年 leichunfeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "TestsHelper.h"

/// RACSequence 类簇（class cluster），代表不可变的值的序列
///
/// RACSequence 共有 9 个私有的、具体的子类，它们是：
///
/// RACArraySequence    遍历数组
/// RACDynamicSequence  动态序列
/// RACEagerSequence    非懒计算的序列
/// RACEmptySequence    空序列
/// RACIndexSetSequence 遍历索引集
/// RACSignalSequence   遍历信号
/// RACStringSequence   遍历字符串
/// RACTupleSequence    遍历元组
/// RACUnarySequence    一元序列
///
/// 继承关系如下：
///
/// * NSObject
/// L * RACStream
///   L * RACSequence
///   L * RACDynamicSequence
///   L * RACEmptySequence
///   L * RACIndexSetSequence
///   L * RACSignalSequence
///   L * RACStringSequence
///   L * RACTupleSequence
///   L * RACUnarySequence
///   L * RACArraySequence
///     L * RACEagerSequence

@interface RACSequenceTests : XCTestCase

@end

@implementation RACSequenceTests

#pragma mark - Find out all methods

- (void)testFindOutAllMethods {
    NSArray *classes = @[
		@"RACStream",
        @"RACSequence",
        @"RACUnarySequence",
        @"RACIndexSetSequence",
        @"RACEmptySequence",
        @"RACDynamicSequence",
        @"RACSignalSequence",
        @"RACArraySequence",
        @"RACEagerSequence",
        @"RACStringSequence",
        @"RACTupleSequence",
    ];

    NSArray *classMethods = [TestsHelper classMethodsInClasses:classes];

    NSLog(@"classMethods: %@", classMethods);

    // 输出如下
    //
    // 1. 打勾的表示是公开的方法，下面有提供相应的测试用例
    // 2. 打叉的表示是私有的方法或者其他不相关的方法
    //
    // √ "+ (id)concat:(id)arg0 ",
    // √ "+ (id)empty",
    // × "+ (id)join:(id)arg0 block:(@?)arg1 ",
    // √ "+ (id)return:(id)arg0 ",
    // × "+ (id)sequenceWithArray:(id)arg0 offset:(Q)arg1 ",
    // √ "+ (id)sequenceWithHeadBlock:(@?)arg0 tailBlock:(@?)arg1 ",
    // × "+ (id)sequenceWithIndexSet:(id)arg0 ",
    // × "+ (id)sequenceWithIndexSetSequence:(id)arg0 offset:(Q)arg1 ",
    // × "+ (id)sequenceWithLazyDependency:(@?)arg0 headBlock:(@?)arg1 tailBlock:(@?)arg2 ",
    // × "+ (id)sequenceWithSignal:(id)arg0 ",
    // × "+ (id)sequenceWithString:(id)arg0 offset:(Q)arg1 ",
    // × "+ (id)sequenceWithTupleBackingArray:(id)arg0 offset:(Q)arg1 ",
    // √ "+ (id)zip:(id)arg0 ",
    // √ "+ (id)zip:(id)arg0 reduce:(@?)arg1 "

    NSArray *instanceMethods = [TestsHelper instanceMethodsInClasses:classes];

    NSLog(@"instanceMethods: %@", instanceMethods);

    // 输出如下
    //
    // 1. 打勾的表示是公开的方法，下面有提供相应的测试用例
    // 2. 打叉的表示是私有的方法或者其他不相关的方法
    //
    // × "- (void).cxx_destruct",
    // √ "- (BOOL)all:(@?)arg0 ",
    // √ "- (BOOL)any:(@?)arg0 ",
    // √ "- (id)array",
    // × "- (id)backingArray",
    // × "- (id)bind:(@?)arg0 passingThroughValuesFromSequence:(id)arg1 ",
    // √ "- (id)bind:(@?)arg0 ",
    // × "- (class)classForCoder",
    // √ "- (id)combinePreviousWithStart:(id)arg0 reduce:(@?)arg1 ",
    // √ "- (id)concat:(id)arg0 ",
    // × "- (id)copyWithZone:({_NSZone=} *)arg0 ",
    // × "- (Q)count",
    // × "- (Q)countByEnumeratingWithState:({?=Q^@^Q[5Q]} *)arg0 objects:(id *)arg1 count:(Q)arg2 ",
    // × "- (id)data",
    // × "- (void)dealloc",
    // × "- (@?)dependencyBlock",
    // × "- (id)description",
    // √ "- (id)distinctUntilChanged",
    // √ "- (id)eagerSequence",
    // × "- (void)encodeWithCoder:(id)arg0 ",
    // √ "- (id)filter:(@?)arg0 ",
    // √ "- (id)flatten",
    // √ "- (id)flattenMap:(@?)arg0 ",
    // × "- (id)foldLeftWithStart:(id)arg0 combine:(@?)arg1 ",
    // √ "- (id)foldLeftWithStart:(id)arg0 reduce:(@?)arg1 ",
    // × "- (id)foldRightWithStart:(id)arg0 combine:(@?)arg1 ",
    // √ "- (id)foldRightWithStart:(id)arg0 reduce:(@?)arg1 ",
    // × "- (BOOL)hasDependency",
    // × "- (Q)hash",
    // √ "- (id)head",
    // × "- (id)headBlock",
    // √ "- (id)ignore:(id)arg0 ",
    // × "- (r^Q)indexes",
    // × "- (id)init",
    // × "- (id)initWithCoder:(id)arg0 ",
    // × "- (BOOL)isEqual:(id)arg0 ",
    // √ "- (id)lazySequence",
    // √ "- (id)map:(@?)arg0 ",
    // × "- (id)mapPreviousWithStart:(id)arg0 reduce:(@?)arg1 ",
    // √ "- (id)mapReplace:(id)arg0 ",
    // × "- (id)name",
    // × "- (id)objectEnumerator",
    // √ "- (id)objectPassingTest:(@?)arg0 ",
    // × "- (Q)offset",
    // √ "- (id)reduceEach:(@?)arg0 ",
    // × "- (id)scanWithStart:(id)arg0 combine:(@?)arg1 ",
    // √ "- (id)scanWithStart:(id)arg0 reduce:(@?)arg1 ",
    // √ "- (id)scanWithStart:(id)arg0 reduceWithIndex:(@?)arg1 ",
    // × "- (id)sequenceMany:(@?)arg0 ",
    // × "- (void)setDependencyBlock:(@?)arg0 ",
    // × "- (void)setHasDependency:(BOOL)arg0 ",
    // × "- (void)setHead:(id)arg0 ",
    // × "- (void)setHeadBlock:(id)arg0 ",
    // × "- (void)setName:(id)arg0 ",
    // × "- (id)setNameWithFormat:(id)arg0 ",
    // × "- (void)setTailBlock:(id)arg0 ",
    // √ "- (id)signal",
    // √ "- (id)signalWithScheduler:(id)arg0 ",
    // √ "- (id)skip:(Q)arg0 ",
    // √ "- (id)skipUntilBlock:(@?)arg0 ",
    // √ "- (id)skipWhileBlock:(@?)arg0 ",
    // √ "- (id)startWith:(id)arg0 ",
    // × "- (id)string",
    // × "- (id)subject",
    // √ "- (id)tail",
    // × "- (id)tailBlock",
    // √ "- (id)take:(Q)arg0 ",
    // √ "- (id)takeUntilBlock:(@?)arg0 ",
    // √ "- (id)takeWhileBlock:(@?)arg0 ",
    // × "- (id)tupleBackingArray",
    // √ "- (id)zipWith:(id)arg0 "
}

#pragma mark - Class methods

/// RACArraySequence
- (void)testClassMethod_concat {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [RACSequence concat:@[ letters, numbers ]];
    RACSequence *expect = [@"A B C D E F G H I 1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACEmptySequence
- (void)testClassMethod_empty {
    RACSequence *result = [RACSequence empty];
    XCTAssertTrue(result.head == nil);
}

/// RACUnarySequence
- (void)testClassMethod_return {
    RACSequence *result = [RACSequence return:@"A"];
    XCTAssertTrue(result.array.count == 1 && [result.head isEqualToString:@"A"]);
}

/// RACDynamicSequence
- (void)testClassMethod_sequenceWithHeadBlock_tailBlock {
    RACSequence *result = [RACSequence sequenceWithHeadBlock:^{
        return @"A";
    } tailBlock:^{
        return [@"B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
    }];

    RACSequence *expect = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testClassMethod_zip {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [RACSequence zip:@[ letters, numbers ]];
    RACSequence *expect = @[
        RACTuplePack(@"A", @"1"),
        RACTuplePack(@"B", @"2"),
        RACTuplePack(@"C", @"3"),
        RACTuplePack(@"D", @"4"),
        RACTuplePack(@"E", @"5"),
        RACTuplePack(@"F", @"6"),
        RACTuplePack(@"G", @"7"),
        RACTuplePack(@"H", @"8"),
        RACTuplePack(@"I", @"9"),
    ].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testClassMethod_zip_reduce {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [RACSequence
        zip:@[ letters, numbers ]
        reduce:^(NSString *letter, NSString *number) {
        	return [NSString stringWithFormat:@"%@-%@", letter, number];
        }];
    RACSequence *expect = [@"A-1 B-2 C-3 D-4 E-5 F-6 G-7 H-8 I-9" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

#pragma mark - Instance methods

/// RACArraySequence
- (void)testInstanceMethod_all {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    BOOL result = [numbers all:^(NSString *number) {
        return @(number.integerValue >= 5).boolValue;
    }];

    XCTAssertFalse(result);
}

/// RACArraySequence
- (void)testInstanceMethod_any {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    BOOL result = [numbers any:^(NSString *number) {
        return @(number.integerValue >= 5).boolValue;
    }];

    XCTAssertTrue(result);
}

/// RACArraySequence
- (void)testInstanceMethod_array {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
    NSArray *expect = [@"A B C D E F G H I" componentsSeparatedByString:@" "];
    XCTAssertTrue([letters.array isEqualToArray:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_bind {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [letters bind:^{
        return ^(NSString *letter, BOOL *stop) {
            if ([letter isEqualToString:@"E"]) *stop = YES;
            return [RACSequence return:[letter stringByAppendingString:letter]];
        };
    }];

    RACSequence *expect = [@"AA BB CC DD EE" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_combinePreviousWithStart_reduce {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [numbers
        combinePreviousWithStart:@"0"
        reduce:^(NSString *previous, NSString *current) {
        	return @(previous.integerValue + current.integerValue).stringValue;
        }];

    RACSequence *expect = [@"1 3 5 7 9 11 13 15 17" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACIndexSetSequence
- (void)testInstanceMethod_concat {
    RACSequence *indexSet1 = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(01, 9)].rac_sequence;
    RACSequence *indexSet2 = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(10, 9)].rac_sequence;

    RACSequence *result = [indexSet1 concat:indexSet2];
    RACSequence *expect = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(01, 18)].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_distinctUntilChanged {
    RACSequence *letters = [@"A A B B C C D D E E F F G G H H I I" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = letters.distinctUntilChanged;
    RACSequence *expect = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACEagerSequence
- (void)testInstanceMethod_eagerSequence {
    RACSequence *result = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.eagerSequence;
    NSArray *expect = [@"A B C D E F G H I" componentsSeparatedByString:@" "];
    XCTAssertTrue([result.array isEqualToArray:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_filter {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [numbers filter:^(NSString *number) {
        return @(number.integerValue % 2 == 0).boolValue;
    }];

    RACSequence *expect = [@"2 4 6 8" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_flatten {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *sequenceOfSequences = @[ letters, numbers ].rac_sequence;

    RACSequence *result = sequenceOfSequences.flatten;
    RACSequence *expect = [@"A B C D E F G H I 1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_flattenMap {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [letters flattenMap:^(NSString *letter) {
        return @[ letter, letter ].rac_sequence;
    }];

    RACSequence *expect = [@"A A B B C C D D E E F F G G H H I I" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_foldLeftWithStart_reduce {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    NSString *result = [numbers
        foldLeftWithStart:@"0"
        reduce:^(NSString *accumulator, NSString *next) {
            return @(accumulator.integerValue + next.integerValue).stringValue;
        }];

    XCTAssertTrue([result isEqualToString:@"45"]);
}

/// RACArraySequence
- (void)testInstanceMethod_foldRightWithStart_reduce {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    NSString *result = [numbers
        foldRightWithStart:@"0"
        reduce:^(NSString *first, RACSequence *rest) {
        	return @(first.integerValue + [rest.head integerValue]).stringValue;
        }];

    XCTAssertTrue([result isEqualToString:@"45"]);
}

/// RACArraySequence
- (void)testInstanceMethod_head {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
    NSString *result = letters.head;
    XCTAssertTrue([result isEqualToString:@"A"]);
}

/// RACArraySequence
- (void)testInstanceMethod_ignore {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [numbers ignore:@"5"];
    RACSequence *expect = [@"1 2 3 4 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_lazySequence {
    RACSequence *result = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
    NSArray *expect = [@"A B C D E F G H I" componentsSeparatedByString:@" "];
    XCTAssertTrue([result.array isEqualToArray:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_map {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [letters map:^(NSString *letter) {
        return [letter stringByAppendingString:letter];
    }];

    RACSequence *expect = [@"AA BB CC DD EE FF GG HH II" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_mapReplace {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [letters mapReplace:@"X"];
    RACSequence *expect = [@"X X X X X X X X X" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_objectPassingTest {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    NSString *result = [letters objectPassingTest:^(NSString *letter) {
        return [letter isEqualToString:@"E"];
    }];

    XCTAssertTrue([result isEqualToString:@"E"]);
}

/// RACArraySequence
- (void)testInstanceMethod_reduceEach {
    RACSequence *tuples = @[
        RACTuplePack(@"A", @"1"),
        RACTuplePack(@"B", @"2"),
        RACTuplePack(@"C", @"3"),
        RACTuplePack(@"D", @"4"),
        RACTuplePack(@"E", @"5"),
        RACTuplePack(@"F", @"6"),
        RACTuplePack(@"G", @"7"),
        RACTuplePack(@"H", @"8"),
        RACTuplePack(@"I", @"9"),
    ].rac_sequence;

    RACSequence *result = [tuples reduceEach:^(NSString *letter, NSString *number) {
        return [NSString stringWithFormat:@"%@-%@", letter, number];
    }];

    RACSequence *expect = [@"A-1 B-2 C-3 D-4 E-5 F-6 G-7 H-8 I-9" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_scanWithStart_reduce {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [numbers
        scanWithStart:@"0"
        reduce:^(NSString *running, NSString *next) {
        	return @(running.integerValue + next.integerValue).stringValue;
        }];

    RACSequence *expect = [@"1 3 6 10 15 21 28 36 45" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_scanWithStart_reduceWithIndex {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [numbers
        scanWithStart:@"0"
        reduceWithIndex:^(NSString *running, NSString *next, NSUInteger index) {
        	return @(running.integerValue + next.integerValue + index).stringValue;
        }];

    RACSequence *expect = [@"1 4 9 16 25 36 49 64 81" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_signal {
    RACSignal *result = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    NSArray *expect = [@"A B C D E F G H I" componentsSeparatedByString:@" "];
    XCTAssertTrue([result.toArray isEqualToArray:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_signalWithScheduler {
    RACSignal *result = [[@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence signalWithScheduler:[RACScheduler scheduler]];
    NSArray *expect = [@"A B C D E F G H I" componentsSeparatedByString:@" "];
    XCTAssertTrue([result.toArray isEqualToArray:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_skip {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [letters skip:5];
    RACSequence *expect = [@"F G H I" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACStringSequence
- (void)testInstanceMethod_skipUntilBlock {
    RACSequence *numbers = @"123456789".rac_sequence;

    RACSequence *result = [numbers skipUntilBlock:^(NSString *number) {
        return @(number.integerValue >= 5).boolValue;
    }];

    RACSequence *expect = @"56789".rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACSignalSequence
- (void)testInstanceMethod_skipWhileBlock {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal.sequence;

    RACSequence *result = [numbers skipWhileBlock:^(NSString *number) {
        return @(number.integerValue <= 5).boolValue;
    }];

    RACSequence *expect = [@"6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal.sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_startWith {
    RACSequence *letters = [@"B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [letters startWith:@"A"];
    RACSequence *expect = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_tail {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = letters.tail;
    RACSequence *expect = [@"B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACArraySequence
- (void)testInstanceMethod_take {
    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;

    RACSequence *result = [letters take:5];
    RACSequence *expect = [@"A B C D E" componentsSeparatedByString:@" "].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACStringSequence
- (void)testInstanceMethod_takeUntilBlock {
    RACSequence *numbers = @"123456789".rac_sequence;

    RACSequence *result = [numbers takeUntilBlock:^(NSString *number) {
        return @(number.integerValue >= 5).boolValue;
    }];

    RACSequence *expect = @"1234".rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACSignalSequence
- (void)testInstanceMethod_takeWhileBlock {
    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal.sequence;

    RACSequence *result = [numbers takeWhileBlock:^(NSString *number) {
        return @(number.integerValue <= 5).boolValue;
    }];

    RACSequence *expect = [@"1 2 3 4 5" componentsSeparatedByString:@" "].rac_sequence.signal.sequence;

    XCTAssertTrue([result isEqual:expect]);
}

/// RACTupleSequence
- (void)testInstanceMethod_zipWith {
    RACSequence *letters = [RACTuple tupleWithObjectsFromArray:[@"A B C D E F G H I" componentsSeparatedByString:@" "]].rac_sequence;
    RACSequence *numbers = [RACTuple tupleWithObjectsFromArray:[@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "]].rac_sequence;

    RACSequence *result = [letters zipWith:numbers];
    RACSequence *expect = [RACTuple tupleWithObjectsFromArray:@[
        RACTuplePack(@"A", @"1"),
        RACTuplePack(@"B", @"2"),
        RACTuplePack(@"C", @"3"),
        RACTuplePack(@"D", @"4"),
        RACTuplePack(@"E", @"5"),
        RACTuplePack(@"F", @"6"),
        RACTuplePack(@"G", @"7"),
        RACTuplePack(@"H", @"8"),
        RACTuplePack(@"I", @"9"),
    ]].rac_sequence;

    XCTAssertTrue([result isEqual:expect]);
}

@end
