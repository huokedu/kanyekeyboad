//
//  KanyeTableViewCell.m
//  iOSKeyboardTemplateContainer
//
//  Created by Sam Stone on 11/03/2015.
//  Copyright (c) 2015 Jeff Blagg. All rights reserved.
//

#import "KanyeTableViewCell.h"

@implementation KanyeTableViewCell
@synthesize requiredCellHeight;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize maxSize = CGSizeMake(220.0f, CGFLOAT_MAX);
    CGSize requiredSize = [self.ContentText sizeThatFits:maxSize];
    
    requiredSize = [self.ContentText sizeThatFits:maxSize];
    
    requiredSize = [self.ContentText sizeThatFits:maxSize];
    self.ContentText.frame = CGRectMake(self.ContentText.frame.origin.x, self.ContentText.frame.origin.y, requiredSize.width, requiredSize.height);
    
    // Reposition labels to handle content height changes
    
    
    CGRect contentTextFrame = self.ContentText.frame;
       self.ContentText.frame = contentTextFrame;
    _ContentText.text = @"poooooo";
    
    // Calculate cell height
    
    requiredCellHeight = 15.0f + 3.0f + 7.0f + 15.0f;
 
    requiredCellHeight += self.ContentText.frame.size.height;
    
    
}

@end
