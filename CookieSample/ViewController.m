//
//  ViewController.m
//  CookieSample
//
//  Created by 麻生 拓弥 on 2017/02/01.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

#import "ViewController.h"
#import "WebBrowseViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstInstalledDateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDate *date = [defaults objectForKey:@"FirstInstalledDate"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    self.firstInstalledDateLabel.text = [dateFormatter stringFromDate:date];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"web"]) {
        WebBrowseViewController *webVC = [segue destinationViewController];
        webVC.urlStr = @"https://google.com";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
