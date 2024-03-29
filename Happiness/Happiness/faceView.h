//
//  faceView.h
//  Happiness
//
//  Created by Deepak Kumar on 06/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;

@protocol FaceViewDataSource
- (float) smileForFaceView:(FaceView *)sender;
@end

@interface faceView : UIView

@property (nonatomic) CGFloat scale;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@property (nonatomic,weak) IBOutlet id<FaceViewDataSource>dataSource;

@end
