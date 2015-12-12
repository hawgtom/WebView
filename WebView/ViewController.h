//
//  ViewController.h
//  WebView
//
//  Created by Gowtham on 12/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)goButton:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UITextField *urlText;
- (IBAction)backtap:(id)sender;
@end

