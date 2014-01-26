//
//  AppDelegate.h
//  rotoCamiPhone
//
//  Created by Rozzles on 13/09/2013.
//  Copyright (c) 2013 rotoCam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CBPeripheral *activePeripheral;
@end
