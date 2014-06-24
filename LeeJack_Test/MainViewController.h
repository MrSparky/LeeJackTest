//
//  MainViewController.h
//  LeeJack_Test
//
//  Created by Sean Parker on 6/23/14.
//  Copyright (c) 2014 LiteGear. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@property (weak, nonatomic) IBOutlet UIButton *currentButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSwitch;
@property (assign, nonatomic) bool oneShotEnabled;
@property (assign) unsigned int testPattern;

- (IBAction)patternClicked:(UIButton *)sender;
- (IBAction)switchToggled:(UISegmentedControl *)sender;

@end
