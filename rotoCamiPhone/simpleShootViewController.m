//
//  simpleShootViewController.m
//  toroCamiPhone
//
//  Created by Rozzles on 20/09/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import "simpleShootViewController.h"

@interface simpleShootViewController ()

@end

@implementation simpleShootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TimeDelaySliderChange:(id)sender forEvent:(UIEvent *)event {
    _TimeDelayValue.text = (@"%.2f", _TimeDelaySlider.value);
}
@end
