//
//  RCCImageContainerTableViewCell.h
//  ReliefCommandCenter
//
//  Created by Paul John Parreno on 11/17/13.
//  Copyright (c) 2013 Paul John Parreno. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ROW_IMAGE_CONTAINER_HEIGHT 250.0f;

@interface RCCImageContainerTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *photoView;

@property (nonatomic, strong) IBOutlet UIButton *editButton;

@end
