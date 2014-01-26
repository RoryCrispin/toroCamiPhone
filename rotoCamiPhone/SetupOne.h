//
//  SetupOne.h
//  toroCamiPhone
//
//  Created by Rozzles on 21/09/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "SerialGATT.h"



@interface SetupOne : UIViewController<BTSmartSensorDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, retain) CBPeripheral *thePeripheral;
@property (nonatomic, retain) CBPeripheral *peripheral;
@property (weak, nonatomic) IBOutlet UIPickerView *DevicePicker;

@property (strong, nonatomic) SerialGATT *sensor;
@property (nonatomic, retain) NSMutableArray *
peripheralViewControllerArray;
@property (nonatomic, retain) NSMutableArray *
peripheralArray;
@property (weak, nonatomic) IBOutlet UIButton *ScanButton;
- (IBAction)SetupOneConnectAction:(id)sender;


- (IBAction)actionSetupOneScan:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *SetupOneScanConnectButton;

@end 
