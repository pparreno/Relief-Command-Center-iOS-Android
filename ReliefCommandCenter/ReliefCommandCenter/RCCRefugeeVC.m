//
//  RCCAddRefugeeViewController.m
//  ReliefCommandCenter
//
//  Created by Paul John Parreno on 11/16/13.
//  Copyright (c) 2013 Paul John Parreno. All rights reserved.
//

#import "RCCRefugeeVC.h"

#import "RCCImageContainerTableViewCell.h"
#import "RCCTextFieldTableViewCell.h"
#import "RCCTextLabelTableViewCell.h"

#define IDENTIFIER_ROW_IMAGECONTAINER @"RCC_TROW1"
#define IDENTIFIER_ROW_TEXTFIELD @"RCC_TROW_TEXTFIELD"


@interface RCCRefugeeVC ()

//@property (nonatomic, strong) BSKeyboardControls *keyboardControls;
@property (nonatomic, strong) NSMutableArray *fieldsArray;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImageView *targetImageView;


@end

@implementation RCCRefugeeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Add Record";
    
    self.fieldsArray = [NSMutableArray array];
    
//    [self setKeyboardControls:[[BSKeyboardControls alloc] init]];
//    [self.keyboardControls setDelegate:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:nil];
    
    [self.navigationItem setRightBarButtonItem:saveBarButtonItem];
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
    
    
    if (indexPath.row == 0) {
        cellIdentifier = IDENTIFIER_ROW_IMAGECONTAINER;
        cell = (RCCImageContainerTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"RCCImageContainerTableViewCell" owner:nil options:nil];
            
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[RCCImageContainerTableViewCell class]]) {
                    cell = (RCCImageContainerTableViewCell *)currentObject;
                    break;
                }
            }
            
            RCCImageContainerTableViewCell *row1Cell = (RCCImageContainerTableViewCell *)cell;
            self.targetImageView = row1Cell.photoView;
            [row1Cell.editButton addTarget:self action:@selector(presentActionsheetForMedia) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
    } else {

        cellIdentifier = @"RCC_TROW_TEXTLABEL";
        cell = (RCCTextLabelTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"RCCTextLabelTableViewCell" owner:nil options:nil];
            
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[RCCTextLabelTableViewCell class]]) {
                    cell = (RCCTextLabelTableViewCell*)currentObject;
                    break;
                }
            }
            
            RCCTextLabelTableViewCell *rowCell = (RCCTextLabelTableViewCell *)cell;
            
//            rowCell.textLabel.
//            rowCell.textField.delegate = self;
            
//            self.keyboardControls.fields = nil;
            [self.fieldsArray addObject:rowCell.textLabel.text];
//            self.keyboardControls.fields = self.fieldsArray;
            
            switch (indexPath.row) {
                case 1:
                {
                    rowCell.textLabel.text = @"First Name";
                } break;
                case 2:
                {
                    rowCell.textLabel.text = @"Last Name";
                } break;
                case 3:
                {
                    rowCell.textLabel.text = @"Sex";
                } break;
                case 4:
                {
                    rowCell.textLabel.text = @"Status";
                } break;
                case 5:
                {
                    rowCell.textLabel.text = @"Age";
                } break;
                case 6:
                {
                    rowCell.textLabel.text = @"Street Address";
                } break;
                case 7:
                {
                    rowCell.textLabel.text = @"City";
                } break;
                case 8:
                {
                    rowCell.textLabel.text = @"Province";
                } break;
                case 9:
                {
                    rowCell.textLabel.text = @"Last Known Location";
                } break;
                    
            }
            
        }
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - BSKeyboardControlsDelegate

- (void)keyboardControls:(BSKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(BSKeyboardControlsDirection)direction
{
    UIView *view;
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        view = field.superview.superview;
    } else {
        view = field.superview.superview.superview;
    }
    
    [self.tableView scrollRectToVisible:view.frame animated:YES];
}



#pragma mark - USER DEFINED METHODS
- (void) presentActionsheetForMedia {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:Nil otherButtonTitles:@"Capture an Image", @"Select from Album", nil];
    [actionSheet showInView:self.view];
}

- (void)keyboardWillShow:(NSNotification*)aNotification {
    NSLog(@"inside method keyboardWillShow");
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(self.tableView.contentInset.top, 0.0, kbSize.height, 0.0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillHide:(NSNotification*)aNotification {
    NSLog(@"inside method keyboardWillHide");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.35];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(self.tableView.contentInset.top, 0.0, 0.0, 0.0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
    [UIView commitAnimations];
}




@end
