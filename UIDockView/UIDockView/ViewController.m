//
//  ViewController.m
//  study_Dock
//
//  Created by 中 青宝 on 12-12-4.
//  Copyright (c) 2012年 中 青宝. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize label;
@synthesize testView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGPoint)getPositionFromOrientation:(UIInterfaceOrientation)interfaceOrientation viewSize:(CGSize)viewSize
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation))
    {
        return CGPointMake(screenSize.width / 2.0f, screenSize.height - (viewSize.height / 2.0f));
    }
    else
    {
        return CGPointMake(screenSize.height / 2.0f, screenSize.width - (viewSize.height / 2.0f));
    }
}

- (float)getHeightFromOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation))
    {
        return 300;
    }
    else
    {
        return 100;
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [UIView beginAnimations:@"Rotate" context:NULL];
    [UIView setAnimationDuration:duration];
    self.testView.center = [self getPositionFromOrientation:toInterfaceOrientation viewSize:self.testView.bounds.size];
    
    [UIView commitAnimations];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    return;
//    NSLog(@"screen = %@", [UIScreen mainScreen]);
//    NSLog(@"self.view = %@", self.view);
//    NSLog(@"self.testView = %@", self.testView);
//    NSLog(@"didRotateFromInterfaceOrientation %d", fromInterfaceOrientation);
    self.testView.center = [self getPositionFromOrientation:self.interfaceOrientation viewSize:self.testView.bounds.size];
//    self.testView.center = CGPointMake(self.testView.center.x, [self getHeightFromOrientation:self.interfaceOrientation]);
}

@end
