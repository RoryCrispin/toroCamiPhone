//
//  timelapseViewController.h
//  toroCamiPhone
//
//  Created by Rozzles on 31/10/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import "ViewController.h"
NSMutableArray *hoursArray;
NSMutableArray *minsArray;
NSMutableArray *secsArray;

NSTimeInterval interval;

@interface timelapseViewController : ViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UISlider *UTLshotsSliderChanged;
@property (weak, nonatomic) IBOutlet UIPickerView *UTLtimeDelayPicker;

@property(retain, nonatomic) NSMutableArray *hoursArray;
@property(retain, nonatomic) NSMutableArray *minsArray;
@property(retain, nonatomic) NSMutableArray *secsArray;
- (IBAction)UTLbackButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *UTLtoggleButton;
- (IBAction)UTLtoggleButtonAction:(id)sender;
-(void)didReceiveMessage:(NSString *) message;
@end
