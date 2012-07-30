//
//  ScrollViewViewController.h
//  ScrollImageViewModel
//
//  Created by Deepak Kumar on 27/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    
}
@property (strong, nonatomic) IBOutlet UIButton *choosePhotoButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction) getPhotoFromLibrary:(id) sender;

@end
