//
//  ViewController.m
//  ARCThrowTest
//
//  Created by Dieter Komendera on 23.10.2011.
//  Copyright (c) 2011 abloom. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize throwExceptionButton;
@synthesize throwExceptionWithCFBridgeRetainingButton;


-(IBAction)buttonAction:(id)sender {
  @try {
    if (sender == throwExceptionButton) {
      // crashes on device, but works in simulator
      [self throwException];
    } else if (sender == throwExceptionWithCFBridgeRetainingButton) {
      // works on simulator and device
      [self throwExceptionWithCFBridgingRetain];
    }
  }
  @catch (NSException *exception) {
    NSLog(@"Cought exception %@", [exception name]);
  }
}

-(void)throwException {
  // crashes on iOS Device, works on simulator
  @throw [NSException exceptionWithName:@"Exception" reason:@"none" userInfo:nil];
}

-(void)throwExceptionWithCFBridgingRetain {
  // workaround: doesn't crash
  @throw CFBridgingRetain([NSException exceptionWithName:@"ExceptionWithCFBridgingRetain" reason:@"none" userInfo:nil]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [self setThrowExceptionButton:nil];
  [self setThrowExceptionWithCFBridgeRetainingButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

@end
