//
//  Services.h
//  RCC_App
//
//  Created by ValiantL on 11/16/13.
//  Copyright (c) 2013 Hack4CausePh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Services : NSObject

@property (strong,nonatomic) NSString *militaryContactName, *militaryContactNum, *militaryContactEmail,*purpose,*status,*baseLocationName;
@property (strong,nonatomic) NSDate *date,*timeIn,*timeOut,*updatedAt,*createdAt;


@end
