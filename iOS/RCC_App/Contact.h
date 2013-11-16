//
//  Person.h
//  RCC_App
//
//  Created by ValiantL on 11/16/13.
//  Copyright (c) 2013 Hack4CausePh. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef enum{MILITARY,GENERAL_USER}userLevel;
@interface Contact : NSObject

@property (strong,nonatomic) NSString *address_1,*givenName,*familyName,*address_2,*email,*mobile_1,*mobile_2,*telephone_1,*telephone_2,*profession;
@property (strong,nonatomic) NSDate *createdAt, *updatedAt;
@property (strong,nonatomic) NSNumber *age;
@property (assign,nonatomic) NSInteger objectID;
//@property (assign,nonatomic) userLevel level;
@property (assign,nonatomic) BOOL volunter;

@end
