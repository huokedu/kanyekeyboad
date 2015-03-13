//
//  KanyeTableViewCell.h
//  iOSKeyboardTemplateContainer
//
//  Created by Sam Stone on 11/03/2015.
//  Copyright (c) 2015 Jeff Blagg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KanyeTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *ContentText;
@property (nonatomic) float requiredCellHeight;
@end
