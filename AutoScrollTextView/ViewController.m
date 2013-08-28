//
//  ViewController.m
//  AutoScrollTextView
//
//  Created by azu on 2013/08/28.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.autoScrollTextView.scrollingDelegate = self;
    self.autoScrollTextView.scrollingIncrement = 2;
}

- (void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
    [self.autoScrollTextView startAutoScroll];
}

- (void)willBeginScroll:(AutoScrollTextView *) scrollTextView {
    NSLog(@"willBeginScroll: %@", scrollTextView);
}

- (void)didEndScroll:(AutoScrollTextView *) scrollTextView {
    NSLog(@"didEndScroll: %@", scrollTextView);
}

@end