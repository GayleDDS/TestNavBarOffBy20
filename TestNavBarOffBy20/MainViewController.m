//
//  MainViewController.m
//  TestNavBarOffBy20
//
//  Created by Gayle Dunham on 5/17/13.
//  Copyright (c) 2013 Gayle Dunham. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DDSAppDelegate.h"

@interface MainViewController ()

@property (weak, nonatomic) UIView *containerView;

- (IBAction)toggleMenuAction:(id)sender;

@end

@implementation MainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.containerView = self.navigationController.view.superview;
    
    self.containerView.layer.shadowOpacity = 0.75f;
    self.containerView.layer.shadowRadius = 10.0f;
    self.containerView.layer.shadowColor = [UIColor blackColor].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)toggleMenuAction:(id)sender
{
    DDSAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

    CGRect viewFrame = self.containerView.frame;
    CGRect windowFrame = appDelegate.window.frame;
    
    if (viewFrame.origin.x == 0) {
        CGFloat newX = windowFrame.size.width * 240.0 / 320.0;
        viewFrame.origin.x = newX;
    } else {
        viewFrame.origin.x = 0.0;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.containerView setFrame: viewFrame];
    }];
}

@end
