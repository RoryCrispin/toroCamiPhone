//
//  simpleShootViewController.h
//  toroCamiPhone
//
//  Created by Rozzles on 20/09/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TIMEARRAY 0

float bulbModeSliderValue;
BOOL bulbModeBool;

@interface simpleShootViewController : UIViewController

<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    __weak IBOutlet UIPickerView *BulbModePickerSet;
    NSMutableArray *timeArray;
}

@property (weak, nonatomic) IBOutlet UIPickerView *BulbModePickerObj;
@property (weak, nonatomic) IBOutlet UISlider *TimeDelaySlider;
@property (weak, nonatomic) IBOutlet UILabel *TimeDelayValue;
- (IBAction)TimeDelaySliderChange:(id)sender forEvent:(UIEvent *)event;
- (IBAction)BulbModeSliderChange:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *BulbModeSlider;
@property (weak, nonatomic) IBOutlet UISwitch *BulbModeSwitch;

- (IBAction)BulbModeSwitchChange:(id)sender;
- (IBAction)captureButtonAction:(id)sender;
@end
