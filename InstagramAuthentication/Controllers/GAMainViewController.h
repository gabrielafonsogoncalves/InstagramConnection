//
//  GAMainViewController.h
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAImageDelegate.h"

@interface GAMainViewController : UIViewController <GAImageDelegate>

@property (strong, nonatomic) IBOutlet UIButton *logginButton;
@property (strong, nonatomic) IBOutlet UIButton *logoutButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)connect:(id)sender;
- (IBAction)logout:(id)sender;

@end
