//
//  ViewController.m
//  TagsFactory
//
//  Created by DoctorGG on 2017/5/10.
//  Copyright © 2017年 NETEASE. All rights reserved.
//

#import "ViewController.h"
#import "TagViewController.h"
#import "TagFactoryGenerator.h"


@interface ViewController ()

@end

@implementation ViewController

- (IBAction)styleButtonClicked:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TagViewController *tagViewController = (TagViewController *)[storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([TagViewController class])];
    tagViewController.tagStyle = sender.tag + 1;
    
    [self.navigationController pushViewController:tagViewController animated:YES];
}

@end
