//
//  GAMainViewController.m
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAMainViewController.h"
#import "GAImageTableViewDataSource.h"
#import "GAImageService.h"

@interface GAMainViewController ()

@property (strong, nonatomic) GAImageTableViewDataSource *dataSource;

@end

@implementation GAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[GAImageTableViewDataSource alloc ] init];
    self.tableView.dataSource = self.dataSource;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self loadRSSFeeds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadRSSFeeds {
    [self.activityIndicator startAnimating];
    GAImageService *imageService = [[GAImageService alloc] init];
    imageService.delegate = self;
    [imageService fetchImages];
}

#pragma mark GAImageDelegate

- (void)showImages:(NSArray *)images {
    self.dataSource.items = images;
    [self.tableView reloadData];
    [self.activityIndicator stopAnimating];
}

@end
