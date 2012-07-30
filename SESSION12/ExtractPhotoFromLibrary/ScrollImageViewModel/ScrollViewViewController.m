//
//  ScrollViewViewController.m
//  ScrollImageViewModel
//
//  Created by Deepak Kumar on 27/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScrollViewViewController.h"

@interface ScrollViewViewController ()

@end

@implementation ScrollViewViewController
@synthesize choosePhotoButton;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setChoosePhotoButton:nil];
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)getPhotoFromLibrary:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    
     if((UIButton *) sender == choosePhotoButton) 
     {
		picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
         
	 }
    
     [self presentModalViewController:picker animated:YES];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	[picker dismissModalViewControllerAnimated:YES];
	imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

@end

