//
// Created by azu on 2013/08/28.
//


#import "AutoScrollTextView.h"


@interface AutoScrollTextView ()
@property(nonatomic, strong) NSTimer *scrollingTimer;
@end

@implementation AutoScrollTextView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setDefaultValue];
}

- (void)setDefaultValue {
    _scrollingIncrement = 1;
    _scrollingInterval = 60.0 / 1000.0;

}

- (void)startAutoScroll {
    if (self.scrollingTimer == nil) {
        self.scrollingTimer = [NSTimer scheduledTimerWithTimeInterval:(self.scrollingInterval)
                                       target:self
                                       selector:@selector(autoScrollTimerFired)
                                       userInfo:nil
                                       repeats:YES];
    }
    [self willBeginCallback];
}

- (void)stopAutoScroll {
    [self.scrollingTimer invalidate];
    self.scrollingTimer = nil;
    [self didEndCallback];
}


- (void)autoScrollTimerFired {
    if ([self canScrollable]) {
        [self scrollTick];
    } else {
        [self stopAutoScroll];
    }
}

- (void)scrollTick {
    [self setContentOffset:CGPointMake(0,
        self.contentOffset.y + self.scrollingIncrement) animated:NO];
}

- (BOOL)isScrolling {
    return [self.scrollingTimer isValid];
}

- (BOOL)canScrollable {
    CGFloat scrollableHeight = self.contentSize.height - self.frame.size.height;
    return self.contentOffset.y <= scrollableHeight;
}

#pragma mark - delegate
- (void)willBeginCallback {
    if ([self.scrollingDelegate respondsToSelector:@selector(willBeginScroll:)]) {
        [self.scrollingDelegate willBeginScroll:self];
    }
}

- (void)didEndCallback {
    if ([self.scrollingDelegate respondsToSelector:@selector(didEndScroll:)]) {
        [self.scrollingDelegate didEndScroll:self];
    }
}


#pragma mark - userInteraction
- (void)touchesEnded:(NSSet *) touches withEvent:(UIEvent *) event {
    [self stopAutoScroll];
}
@end