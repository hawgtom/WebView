//
//  ViewController.m
//  WebView
//
//  Created by Gowtham on 12/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSString *start;
@property (nonatomic,strong) NSString *load;
@end

@implementation ViewController
@synthesize webView=mWebView;
@synthesize start=start;
@synthesize load=load;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [mWebView release];
    [start release];
    [load release];
    [super dealloc];
}
//////////////////Button Submit to Load URL
- (IBAction)goButton:(UIButton *)sender {
    
    NSString* urlString = self.urlText.text;
    start=self.urlText.text;
    NSURL* url = [NSURL URLWithString:urlString];
    if(!url.scheme)
    {
        NSString* modifiedURLString = [NSString stringWithFormat:@"http://%@", urlString];
        url = [NSURL URLWithString:modifiedURLString];
    }
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
////////Keyboard Funtions For Hiding
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)backtap:(id)sender {
    [self.urlText endEditing:YES];
}
///////Webview Loading Listner
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"Hai");
    return YES;
}
//////Capturing the Start URL
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    start=[webView stringByEvaluatingJavaScriptFromString:@"document.domain"];
}
//////Capturing The Loaded URL
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    load=[webView stringByEvaluatingJavaScriptFromString:@"document.domain"];
       if(![start isEqualToString:load])
    {
        NSLog(@"Start : %@",start);
        NSLog(@"Load : %@",load);

        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"The Page is Redirecting.."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Redirect" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action)
                             {
                            }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        self.urlText.text=load;
    }
}
@end
