//
//  Refugee.h
//  RCC_App
//
//  Created by ValiantL on 11/16/13.
//  Copyright (c) 2013 Hack4CausePh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Refugee : NSObject

@property (nonatomic,strong) NSString *givenName,*familyName,*status,*sex,*streetName,*neighbor,*city,*province,*desc,*sourceName,*sourceContactNum,*sourceEmailAdd,*lastKnowLoc;
@property (nonatomic,strong) NSNumber *age;
@property (assign,nonatomic) NSInteger objectID;
@property (nonatomic,strong) NSDate *createdAt, *updatedAt;

@end
