//
//  WebBrowseViewController.m
//  CookieSample
//
//  Created by 麻生 拓弥 on 2017/02/01.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

#import "WebBrowseViewController.h"

@interface WebBrowseViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebBrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Web";
    self.webView.delegate = self;

    NSURL *url = [NSURL URLWithString:self.urlStr];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
}

-(void)webViewDidStartLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}


-(void)webViewDidFinishLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [cookieJar cookies]) {
        NSLog(@"%@", cookie);
        if ([@".google.co.jp" isEqualToString:cookie.domain]) {
            NSLog(@"Name: %@", cookie.name);
            NSLog(@"Value: %@", cookie.value);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
