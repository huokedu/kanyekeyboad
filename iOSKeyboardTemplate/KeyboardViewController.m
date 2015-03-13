//
//  KeyboardViewController.m
//  iOSKeyboardTemplate
//
//  Copyright (c) 2014 BJH Studios. All rights reserved.
//  questions or comments contact jeff@bjhstudios.com

#import "KeyboardViewController.h"
#import "FLAnimatedImage.h"

@interface KeyboardViewController ()

@property (strong, nonatomic) IBOutlet UIButton *quotes;
@property (strong, nonatomic) IBOutlet UIButton *gifs;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
NSArray * kanyeLines;
NSArray * kanyeGif;
@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *btnLayer = [_quotes layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    _quotes.layer.borderWidth = 0.5;
    _quotes.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    CALayer *btnLayerGif = [_gifs layer];
    [btnLayerGif setMasksToBounds:YES];
    [btnLayerGif setCornerRadius:5.0f];
    _gifs.layer.borderWidth = 0.5;
    _gifs.layer.borderColor = [UIColor blackColor].CGColor;
    
    [btnLayerGif setMasksToBounds:YES];
    [btnLayerGif setCornerRadius:5.0f];
    _tableView.layer.borderWidth = 0.5;
    _tableView.layer.borderColor = [UIColor blackColor].CGColor;
    
    kanyeGif  = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"7", @"8",@"9", @"10",@"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", nil];

    kanyeLines = @[@"I am God's vessel. But my greatest pain in life is that I will never be able to see myself perform live.",@"I hate when I'm on a flight and I wake up with a water bottle next to me like oh great now I gotta be responsible for this water bottle",@"I don't even listen to rap. My apartment is too nice to listen to rap in.", @"Visiting my mind is like visiting the Hermès factory. Sh*t is real.", @"It ain’t Ralph though.", @"You be ballin’ in the D league, I be speakin’ Swagheli",@"I feel like I’m too busy writing history to read it.", @"I think what Kanye West is going to mean is something similar to what Steve Jobs means. I am undoubtedly, you know, Steve of Internet, downtown, fashion, culture.", @"When someone comes up and says something like, 'I am a god,' everybody says 'Who does he think he is?' I just told you who I thought I was. A god. I just told you.",@"Have you ever asked your bitch for other bitches?",@"Stick my fist in her like a civil rights sign.", @"As a man I am flawed, but my music is perfect.", @"My music isn’t just music, its medicine.", @"My greatest pain in life is that I will never be able to see myself perform live.", @"Don't ask me what I think the best song of last year was, because my opinion is the same as most of America's. It was Gold Digger.", @"In my humble opinion, that's a prophetic statement. Gandhi would have said something like that.",@"For me to say I wasn’t a genius, I would just be lying to you and to myself.", @"Come on now! How could you be me and want to be someone else?", @"Jay is Kweli's favourite rapper, 50 is Eminem's favourite rapper, and I’m my favourite rapper.", @"I’m a creative genius and there is no other way to word it."];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    self.collectionView.dataSource = self;
    
   
    _collectionView.delegate = self;

   

    [self.tableView reloadData];
    [self initializeKeyboard];
    
}
-(IBAction) backspaceKeyPressed: (UIButton*) sender {
    
    [self.textDocumentProxy deleteBackward];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return kanyeGif.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:identifier
                                              forIndexPath:indexPath];
    
    
    UIImageView * kanyeGifImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, cell.frame.size.width, cell.frame.size.height)];
    
    
    [kanyeGifImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.gif",[kanyeGif objectAtIndex:indexPath.row]]]];
    
    
    
    [cell.layer setCornerRadius:4];
    
    [cell addSubview:kanyeGifImage];
    
    
   
    
    return cell;
    

    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
   
    UICollectionViewCell *Cell =[collectionView cellForItemAtIndexPath:indexPath];
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:[kanyeGif objectAtIndex:indexPath.row] withExtension:@"gif"];
   
    NSData *data = [NSData dataWithContentsOfURL:url1];
    UIPasteboard *pasteBoard=[UIPasteboard generalPasteboard];
    [pasteBoard setData:data forPasteboardType:@"com.compuserve.gif"];
   //custom font
  
    
   
    
    UILabel *copiedLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (Cell.frame.size.height/2)-10, Cell.frame.size.width, 20)];
    copiedLabel.text = @"Copied!";

    copiedLabel.numberOfLines = 1;
    copiedLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    copiedLabel.adjustsFontSizeToFitWidth = YES;
    copiedLabel.backgroundColor = [UIColor grayColor];
    
    copiedLabel.minimumScaleFactor = 10.0f/12.0f;
    copiedLabel.clipsToBounds = YES;
    copiedLabel.backgroundColor =[UIColor colorWithRed:189 green:195 blue:199 alpha:0.7];;
    copiedLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:14.0];
    copiedLabel.textColor = [UIColor blackColor];
    copiedLabel.textAlignment = NSTextAlignmentCenter;
    [Cell addSubview:copiedLabel];
    [UIView animateWithDuration:3 animations:^(void) {
        copiedLabel.alpha = 0;
   
    }];


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [kanyeLines count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    
    // Configure the cell...
    cell.textLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:14.0];
    cell.textLabel.text = [kanyeLines objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellText =[kanyeLines objectAtIndex:indexPath.row];
    UIFont *cellFont = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:14.0];
    
    NSAttributedString *attributedText =
    [[NSAttributedString alloc]
     initWithString:cellText
     attributes:@
     {
     NSFontAttributeName: cellFont
     }];
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(tableView.bounds.size.width, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    
    return rect.size.height + 20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *Cell =[tableView cellForRowAtIndexPath:indexPath];
    [self.textDocumentProxy insertText:Cell.textLabel.text];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - TextInput methods



#pragma mark - initialization method

- (void) initializeKeyboard {
    
    //start with shift on
   
    
    //initialize space key double tap
    
      
}

#pragma mark - key methods

- (IBAction) globeKeyPressed:(id)sender {
    
    //required functionality, switches to user's next keyboard
    [self advanceToNextInputMode];
}

- (IBAction) keyPressed:(UIButton*)sender {
    
    //inserts the pressed character into the text document
    [self.textDocumentProxy insertText:sender.titleLabel.text];
    
    //if shiftStatus is 1, reset it to 0 by pressing the shift key
    
}




-(IBAction) spaceKeyPressed: (UIButton*) sender {
    
    [self.textDocumentProxy insertText:@" "];
    
}




-(IBAction) returnKeyPressed: (UIButton*) sender {
    
    [self.textDocumentProxy insertText:@"\n"];
}


- (IBAction)gifs:(id)sender;{
    [UIView animateWithDuration:0.2 animations:^(void) {
        _tableView.alpha = 0;
        _collectionView.alpha = 1;
    }];
    
}

- (IBAction)quotes:(id)sender {
    [UIView animateWithDuration:0.2 animations:^(void) {
        _tableView.alpha = 1;
        _collectionView.alpha = 0;
    }];
}





@end
