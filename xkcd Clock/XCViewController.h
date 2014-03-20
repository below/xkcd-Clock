//
//  XCViewController.h
//  xkcd Clock
//
//  Created by Alexander v. Below on 12.03.14.
//  Copyright (c) 2014 Alexander von Below. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *outerClock;
@property (weak, nonatomic) IBOutlet UIImageView *innerClock;

@end
