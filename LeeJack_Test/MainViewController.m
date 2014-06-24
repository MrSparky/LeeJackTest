//
//  MainViewController.m
//  LeeJack_Test
//
//  Created by Sean Parker on 6/23/14.
//  Copyright (c) 2014 LiteGear. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController

@synthesize currentButton;
@synthesize oneShotEnabled = _oneShotEnabled;
@synthesize modeSwitch;
@synthesize testPattern = _testPattern;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

#pragma Main Screen UI

- (IBAction)patternClicked:(UIButton *)sender
{
    if(self.currentButton != nil) {
        [self.currentButton setTitleColor:
            [UIColor colorWithRed:0.0 green:0.5
                             blue:1.0 alpha:1.0]
                                 forState:UIControlStateNormal];
    }
    
    self.currentButton = sender;
    [self.currentButton setTitleColor:[UIColor redColor]
                             forState:UIControlStateNormal];
    
    NSScanner *scanner = [NSScanner scannerWithString:
                          self.currentButton.titleLabel.text];
    [scanner scanHexInt:&_testPattern];
    
}

- (IBAction)switchToggled:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex == 0) {
        _oneShotEnabled = true;
    } else {
        _oneShotEnabled = false;
    }
}

- (void)setOneShotEnabled:(bool)oneShotEnabled {
    _oneShotEnabled = oneShotEnabled;
    if(oneShotEnabled) {
        self.modeSwitch.selectedSegmentIndex = 0;
    } else {
        self.modeSwitch.selectedSegmentIndex = 1;
    }
}


@end
