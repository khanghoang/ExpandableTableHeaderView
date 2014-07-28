//
//  KHViewController.m
//  ExpandableScrollTableView
//
//  Created by Triệu Khang on 28/7/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "KHViewController.h"

@interface KHViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *expandableScrollHeader;

@end

@implementation KHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIEdgeInsets edge = UIEdgeInsetsMake(self.expandableScrollHeader.frame.size.height, 0, 0, 0);

    [self.tableView setContentInset:edge];
    [self.tableView setScrollIndicatorInsets:edge];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentInsetY = self.tableView.contentOffset.y;
    if(contentInsetY < 0) {
        contentInsetY = ABS(contentInsetY);
    }
    else {
        contentInsetY = 0;
    }

    CGFloat topViewHeight = contentInsetY;

    CGRect newFrame = self.expandableScrollHeader.frame;
    newFrame.size.height = topViewHeight;

    self.expandableScrollHeader.frame = newFrame;
}

@end
