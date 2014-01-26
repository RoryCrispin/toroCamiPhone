//
//  FlatHome.m
//  toroCamiPhone
//
//  Created by Rory Crispin on 25/01/2014.
//  Copyright (c) 2014 rotoCam. All rights reserved.
//

#import "FlatHome.h"
#import "BlueComms.h"
#include "REFrostedViewController.h"

@interface FlatHome ()

@end

@implementation FlatHome

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
    BlueComms *bluecomms = [[BlueComms alloc] init];
    [bluecomms setUp];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
