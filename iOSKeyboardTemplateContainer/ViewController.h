

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *urlField;
@property (strong, nonatomic) IBOutlet UITextField *twitterField;


- (IBAction)send:(id)sender;

@end

