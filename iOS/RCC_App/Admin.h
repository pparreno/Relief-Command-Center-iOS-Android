//
//  Admin.h
//  RCC_App
//
//  Created by ValiantL on 11/16/13.
//  Copyright (c) 2013 Hack4CausePh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Admin : NSObject

@property (strong,nonatomic) NSString *userName, *password;
@property (strong,nonatomic) NSDate *createdAt,*updatedAt;
@property (assign,nonatomic) NSInteger objectID;


@end
