//
//  simpleShootViewController.h
//  toroCamiPhone
//
//  Created by Rozzles on 20/09/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface simpleShootViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *TimeDelaySlider;
@property (weak, nonatomic) IBOutlet UILabel *TimeDelayValue;
- (IBAction)TimeDelaySliderChange:(id)sender forEvent:(UIEvent *)event;

@end
