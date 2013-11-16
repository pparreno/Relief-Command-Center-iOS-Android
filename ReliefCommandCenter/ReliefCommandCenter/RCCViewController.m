//
//  RCCViewController.m
//  ReliefCommandCenter
//
//  Created by Paul John Parreno on 11/16/13.
//  Copyright (c) 2013 Paul John Parreno. All rights reserved.
//

#import "RCCViewController.h"

#import "RCCImageContainerTableViewCell.h"

#define IDENTIFIER_ROW_1 @"RCC_TROW1"


@interface RCCViewController ()

@end

@implementation RCCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Add Record";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate


#pragma mark - UITableVIewDatasource


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return ROW_IMAGE_CONTAINER_HEIGHT;
    }
    
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSString *cellIdentifier;
    
    
    switch (indexPath.row) {
        case 0:
        {
            cellIdentifier = IDENTIFIER_ROW_1;
            cell = (RCCImageContainerTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            
            if (cell == nil) {
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"RCCImageContainerTableViewCell" owner:nil options:nil];
            
                for (id currentObject in topLevelObjects) {
                    if ([currentObject isKindOfClass:[RCCImageContainerTableViewCell class]]) {
                        cell = (RCCImageContainerTableViewCell *)currentObject;
                        break;
                    }
                }
                
//                RCCImageContainerTableViewCell *row1Cell = (RCCImageContainerTableViewCell *)cell;
         
            }
        }
            break;
 
            
    }

    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
