//
//  AutoScrollTextViewTests.m
//  AutoScrollTextViewTests
//
//  Created by azu on 2013/08/28.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import "AutoScrollTextViewTests.h"

@interface AutoScrollTextViewTests ()
@property(nonatomic, strong) AutoScrollTextView *autoScrollTextView;
@end

@implementation AutoScrollTextViewTests

- (void)setUp {
    [super setUp];
    self.autoScrollTextView = [[AutoScrollTextView alloc] init];
}

- (void)tearDown {
    self.autoScrollTextView = nil;
    [super tearDown];
}

- (void)testCallDelegateWill {
    [self shouldCallDelegate:^(id delegate) {
        [[delegate expect] willBeginScroll:[OCMArg any]];
    } when:^{
        [self.autoScrollTextView startAutoScroll];
    }];
}

- (void)testCallDelegateDid {
    [self shouldCallDelegate:^(id delegate) {
        [[delegate expect] didEndScroll:[OCMArg any]];
    } when:^{
        [self.autoScrollTextView stopAutoScroll];
    }];
}


- (void)shouldCallDelegate:(void (^)(id)) prepareBlocks when:(void (^)()) thenBlocks {
    id mockDelegate = [OCMockObject mockForProtocol:@protocol(AutoScrollDelegate)];
    self.autoScrollTextView.scrollingDelegate = mockDelegate;
    prepareBlocks(mockDelegate);
    thenBlocks();
    [mockDelegate verify];
}

@end
