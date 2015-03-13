//
//  ViewController.h
//  iOSKeyboardTemplateContainer
//
//  Copyright (c) 2014 BJH Studios. All rights reserved.
//  questions or comments contact jeff@bjhstudios.com

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *urlField;
@property (strong, nonatomic) IBOutlet UITextField *twitterField;


- (IBAction)send:(id)sender;

@end

