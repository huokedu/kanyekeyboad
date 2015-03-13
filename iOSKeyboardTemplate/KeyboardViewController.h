//
//  KeyboardViewController.h
//  iOSKeyboardTemplate
//
//  Copyright (c) 2014 BJH Studios. All rights reserved.
//  questions or comments contact jeff@bjhstudios.com

#import <UIKit/UIKit.h>

@interface KeyboardViewController : UIInputViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)gifs:(id)sender;
- (IBAction)quotes:(id)sender;

@end
