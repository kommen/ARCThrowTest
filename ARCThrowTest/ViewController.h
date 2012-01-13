//
//  ViewController.h
//  ARCThrowTest
//
//  Created by Dieter Komendera on 23.10.2011.
//  Copyright (c) 2011 abloom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(void)throwException;
-(void)throwExceptionWithCFBridgingRetain;

@property (weak, nonatomic) IBOutlet UIButton *throwExceptionButton;
@property (weak, nonatomic) IBOutlet UIButton *throwExceptionWithCFBridgeRetainingButton;

- (IBAction)buttonAction:(id)sender;
@end
