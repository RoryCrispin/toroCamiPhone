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
-(void) sendMessage: (NSString *)message;
-(void) setUp ;
- (void) setDisconnect ;
-(void) write:(NSString *)dataToWrite;
@end
