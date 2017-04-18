//
//  ViewController.m
//  ButtonTest
//
//  Created by zuopengl on 10/6/15.
//  Copyright © 2015 Apple. All rights reserved.
//

#import "ViewController.h"
#import <UITextImageButton.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UITextImageButton *button = [UITextImageButton buttonWithTitle:@"支付" image:[UIImage imageNamed:@"icon_map"]];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleImageType:kUITextImageButtonTypeLeftText];
    [self.view addSubview:button];
    
    UITextImageButton *button2 = [UITextImageButton buttonWithTitle:@"支付" image:[UIImage imageNamed:@"icon_map"]];
    button2.frame = CGRectMake(100, 200, 100, 100);
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button2 setTitleImageType:kUITextImageButtonTypeRightText];
    [self.view addSubview:button2];
    
    UITextImageButton *button3 = [UITextImageButton buttonWithTitle:@"支付" image:[UIImage imageNamed:@"icon_map"]];
    button3.frame = CGRectMake(100, 300, 100, 100);
    [button3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button3 setTitleImageType:kUITextImageButtonTypeTopText];
    [self.view addSubview:button3];
    
    
    UITextImageButton *button4 = [UITextImageButton buttonWithTitle:@"支付" image:[UIImage imageNamed:@"icon_map"]];
    button4.frame = CGRectMake(100, 400, 100, 100);
    [button4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button4 setTitleImageType:kUITextImageButtonTypeBottomText];
    [button4 setSpacing:50];
    [self.view addSubview:button4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
