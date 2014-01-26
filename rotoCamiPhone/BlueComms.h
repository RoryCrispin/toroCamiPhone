//
//  BlueComms.h
//  toroCamiPhone
//
//  Created by Rory Crispin on 25/01/2014.
//  Copyright (c) 2014 rotoCam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerialGATT.h"

@interface BlueComms : NSObject
@property (nonatomic, nonatomic) short openView; //This could be an enum but at the end of the day, it just comoplicates things.
    // 0: Root home
    // 1: Simple shoot
    // 2: Timelapse
-(void) sendMessage: (NSString *)message;
-(void) setUp ;
- (void) setDisconnect ;
-(void) write:(NSString *)dataToWrite;
//-(void) didRecieveData:(NSString *) recvData;

@end
