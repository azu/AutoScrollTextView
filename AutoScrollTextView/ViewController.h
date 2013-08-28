//
//  ViewController.h
//  AutoScrollTextView
//
//  Created by azu on 2013/08/28.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoScrollTextView.h"

@class AutoScrollTextView;

@interface ViewController : UIViewController <AutoScrollDelegate> {
}
@property(weak, nonatomic) IBOutlet AutoScrollTextView *autoScrollTextView;

@end