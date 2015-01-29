//
//  GAMainViewController.m
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAMainViewController.h"
#import "GAImageCollectionDataSource.h"
#import "AppDelegate.h"
#import "GAImageService.h"

@interface GAMainViewController ()

@property (strong, nonatomic) GAImageCollectionDataSource *dataSource;

@end

#define kBaseURL @"https://instagram.com/"
#define kInstagramAPIBaseURL @"https://api.instagram.com"
#define kApiUrl @"https://api.instagram.com/v1/users/"
#define kAuthenticationURL @"oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token&scope=likes+comments+basic"
#define kClientID @"a68bdbe82f7b40c2b2ec535539c48e4d"
#define kRedirectURI @"instagramgabotest://"

@implementation GAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[GAImageCollectionDataSource alloc ] init];
    self.collectionView.dataSource = self.dataSource;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self checkStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)checkStatus
{
    self.logginButton.enabled = ![AppDelegate token];
    self.logoutButton.enabled = [AppDelegate token];
    [self loadImages];
}

- (void)loadImages {
    if ([AppDelegate token]) {
        [self.activityIndicator startAnimating];
        GAImageService *imageService = [[GAImageService alloc] init];
        imageService.delegate = self;
        [imageService fetchImages];
    }
}

#pragma mark GAImageDelegate

- (void)showImages:(NSArray *)images {
    self.dataSource.items = images;
    [self.collectionView reloadData];
    [self.activityIndicator stopAnimating];
}

- (IBAction)connect:(id)sender {
    NSString* urlString = [kBaseURL stringByAppendingFormat:kAuthenticationURL,kClientID,kRedirectURI];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

- (IBAction)logout:(id)sender {
    [AppDelegate saveUserToken:nil];
    [self checkStatus];
    [self showImages:nil];
}

@end
