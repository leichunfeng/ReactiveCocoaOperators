//
//  TestsHelper.m
//  ReactiveCocoaOperations
//
//  Created by leichunfeng on 15/10/25.
//  Copyright © 2015年 leichunfeng. All rights reserved.
//

#import "TestsHelper.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "NSObject+DLIntrospection.h"

@implementation TestsHelper

+ (NSArray *)classMethodsInClasses:(NSArray *)classes {
    return [self methodsInClasses:classes classMethods:YES];
}

+ (NSArray *)instanceMethodsInClasses:(NSArray *)classes {
    return [self methodsInClasses:classes classMethods:NO];
}

+ (NSArray *)methodsInClasses:(NSArray *)classes classMethods:(BOOL)classMethods {
    BOOL (^filter)(NSString *) = ^(NSString *component) {
        return @(component.length > 0 && ![component isEqualToString:@"+"] && ![component isEqualToString:@"-"]).boolValue;
    };
    
    NSString * (^map)(NSString *) = ^(NSString *component) {
        NSString *firstLetter = component.rac_sequence.array.firstObject;
        if ([firstLetter isEqualToString:@"("]) {
            return [[[component.rac_sequence
                skipUntilBlock:^(NSString *character) {
                	return [character isEqualToString:@")"];
                }]
                takeUntilBlock:^(NSString *character) {
                	return [character isEqualToString:@":"];
                }].array componentsJoinedByString:@""];
        } else {
            return [[component.rac_sequence takeUntilBlock:^(NSString *character) {
                return [character isEqualToString:@":"];
            }].array componentsJoinedByString:@""];
        }
    };
    
    NSArray * (^reduce)(NSArray *, NSString *) = ^(NSArray *accumulator, NSString *class) {
        NSArray *methods = classMethods ? [NSClassFromString(class) classMethods] : [NSClassFromString(class) instanceMethods];
        
        accumulator = [accumulator.rac_sequence concat:methods.rac_sequence ?: [RACSequence empty]].array;
        accumulator = [NSSet setWithArray:accumulator].allObjects;
        
        return [accumulator sortedArrayUsingComparator:^(NSString *method1, NSString *method2) {
            RACSequence *components1 = [[[method1 componentsSeparatedByString:@" "].rac_sequence
                filter:filter]
                map:map];
            
            RACSequence *components2 = [[[method2 componentsSeparatedByString:@" "].rac_sequence
                filter:filter]
                map:map];
            
            RACSequence *zippedComponents = [components1 zipWith:components2];
            
            return [[[zippedComponents
                map:^(RACTuple *tuple) {
                	RACTupleUnpack(NSString *component1, NSString *component2) = tuple;
                	return @([component1 compare:component2]);
                }]
                foldLeftWithStart:@(NSOrderedSame)
                reduce:^(NSNumber *accumulator, NSNumber *next) {
                	return accumulator.integerValue == NSOrderedSame ? next : accumulator;
                }] integerValue];
        }];
    };
    
    return [classes.rac_sequence
        foldLeftWithStart:@[]
        reduce:reduce];
}

@end
