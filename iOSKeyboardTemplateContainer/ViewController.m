//
//  ViewController.m
//  iOSKeyboardTemplateContainer
//
//  Copyright (c) 2014 BJH Studios. All rights reserved.
//  questions or comments contact jeff@bjhstudios.com

#import "ViewController.h"
#import <MessageUI/MFMailComposeViewController.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)send:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setToRecipients:[NSArray arrayWithObjects:@"kanyekeyboard@gmail.com",nil]];
    [controller setSubject:@"Yo, you should add this.."];
    [controller setMessageBody:@"Quote:<br>Twitter:" isHTML:YES];
    if (controller) [self presentModalViewController:controller animated:YES];
    }else{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error" message:nil delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil] ;
    [alert show];
    
}


}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissModalViewControllerAnimated:YES];
}


@end
