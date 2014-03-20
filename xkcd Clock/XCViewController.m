//
//  XCViewController.m
//  xkcd Clock
//
//  Created by Alexander v. Below on 12.03.14.
//  Copyright (c) 2014 Alexander von Below. All rights reserved.
//

#import "XCViewController.h"

@interface XCViewController ()

@end

@implementation XCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                                   selector:@selector(updateClock:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateClock:(NSTimer *)sender {
    
    NSDate * now = [NSDate date];
    NSDateComponents *components;
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    components = [gregorian components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour
                              fromDate:now];
    
    NSTimeInterval totalSeconds = components.second + (components.hour * 60 + components.minute) * 60;
    NSTimeInterval noon = 12 * 60 * 60;
    NSTimeInterval adjustedTime = totalSeconds - noon;
    double degrees = adjustedTime * 180.0 / noon;
    [UIView beginAnimations:nil context:nil]; [UIView setAnimationDuration:1.0f]; [UIView setAnimationDelegate:self];
    
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation((degrees * M_PI) / 180.0f);
    self.outerClock.transform = rotateTransform;
    [UIView commitAnimations];
}

@end
