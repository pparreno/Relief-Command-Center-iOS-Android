//
//  RCCAddRefugeeViewController.m
//  ReliefCommandCenter
//
//  Created by Paul John Parreno on 11/16/13.
//  Copyright (c) 2013 Paul John Parreno. All rights reserved.
//

#import "RCCAddRefugeeViewController.h"

#import "RCCImageContainerTableViewCell.h"
#import "RCCTextFieldTableViewCell.h"


#define IDENTIFIER_ROW_IMAGECONTAINER @"RCC_TROW1"
#define IDENTIFIER_ROW_TEXTFIELD @"RCC_TROW_TEXTFIELD"


@interface RCCAddRefugeeViewController ()

@property (nonatomic, strong) BSKeyboardControls *keyboardControls;
@property (nonatomic, strong) NSMutableArray *fieldsArray;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImageView *targetImageView;

@end

@implementation RCCAddRefugeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Add Record";
    
    self.fieldsArray = [NSMutableArray array];
    
    [self setKeyboardControls:[[BSKeyboardControls alloc] init]];
    [self.keyboardControls setDelegate:self];
    
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
        
        cellIdentifier = IDENTIFIER_ROW_TEXTFIELD;
        cell = (RCCTextFieldTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"RCCTextFieldTableViewCell" owner:nil options:nil];
            
            for (id currentObject in topLevelObjects) {
                if ([currentObject isKindOfClass:[RCCTextFieldTableViewCell class]]) {
                    cell = (RCCTextFieldTableViewCell *)currentObject;
                    break;
                }
            }
            
            RCCTextFieldTableViewCell *rowCell = (RCCTextFieldTableViewCell *)cell;
            
            rowCell.textField.delegate = self;
            
            self.keyboardControls.fields = nil;
            [self.fieldsArray addObject:rowCell.textField];
            self.keyboardControls.fields = self.fieldsArray;
        
            switch (indexPath.row) {
                case 1:
                {
                    rowCell.textField.placeholder = @"First Name";
                } break;
                case 2:
                {
                    rowCell.textField.placeholder = @"Last Name";
                } break;
                case 3:
                {
                    rowCell.textField.placeholder = @"Sex";
                } break;
                case 4:
                {
                    rowCell.textField.placeholder = @"Status";
                } break;
                case 5:
                {
                    rowCell.textField.placeholder = @"Age";
                } break;
                case 6:
                {
                    rowCell.textField.placeholder = @"Street Address";
                } break;
                case 7:
                {
                    rowCell.textField.placeholder = @"City";
                } break;
                case 8:
                {
                    rowCell.textField.placeholder = @"Province";
                } break;
                case 9:
                {
                    rowCell.textField.placeholder = @"Last Known Location";
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

- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    NSLog(@"Done Pressed!");
    [self.keyboardControls.activeField resignFirstResponder];
}


#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.keyboardControls setActiveField:textField];
    [self.keyboardControls.activeField isFirstResponder];
    
     UIView *view;
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        view = textField.superview.superview;
    } else {
        view = textField.superview.superview.superview;
    }
    
    [self.tableView scrollRectToVisible:view.frame animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES
                               completion:^{
                               }];
    
    UIImage* image          = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.targetImageView setImage:image];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissViewControllerAnimated:YES completion:^{
    
    }];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            [self pickImageFromCamera];
        } break;
        case 1:
        {
            [self pickImageFromPhotoAlbum];
        } break;
        default:
            break;
    }
}

#pragma mark - USER DEFINED METHODS

- (void) presentActionsheetForMedia {

    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Option"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:Nil
                                                    otherButtonTitles:@"Capture an Image", @"Select from Album", nil];
    [actionSheet showInView:self.view];
}

- (void)keyboardWillShow:(NSNotification*)aNotification {
    NSLog(@"inside method keyboardWillShow");
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets;
    contentInsets = UIEdgeInsetsMake(self.tableView.contentInset.top, 0.0, kbSize.height, 0.0);
    
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


- (void)pickImageFromCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        self.imagePicker = [[UIImagePickerController alloc] init];
        [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        [self.imagePicker setDelegate:self];
        
        [self presentViewController:self.imagePicker animated:YES completion:^{
            //handler here
        }];
    }
    else
    {
        NSLog(@"UIImagePickerControllerSourceTypeCamera UNAVAILABLE!");
        [self pickImageFromPhotoAlbum];
    }
}

-(void)pickImageFromPhotoAlbum
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        self.imagePicker = [[UIImagePickerController alloc] init];
        [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        [self.imagePicker setDelegate:self];
        
        [self presentViewController:_imagePicker
                           animated:YES
                         completion:^{
                             //handler here
                         }];
    }
    else {
        NSLog(@"UIImagePickerControllerSourceTypeSavedPhotosAlbum UNAVAILABLE!");
    }
}




@end
