#import <substrate.h>
#import <UIKit/UIGestureRecognizer.h>
#import <UIKit/UIAlertController.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




@interface PIUser : NSObject
@property (nonatomic, copy, readonly) NSString *fullName;
@property (nonatomic, copy, readonly) NSString *about;
@property (nonatomic, assign, readonly) NSString *followerCountString;
@property (nonatomic, assign, readonly) BOOL followedByMe;
@property (nonatomic, copy, readonly) NSDate *createdAt;
@property (nonatomic, assign, readonly) NSInteger pinCount;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, copy, readonly) NSDate *lastPinSaveTime;
@property (nonatomic, assign, readonly) NSInteger profileViews;
@end

@interface PILegoProfileViewController : UIViewController

@property (nonatomic, strong, readwrite) PIUser *user;

@end

%hook PILegoProfileViewController

- (void)viewDidLoad {
%orig;

// LongPress

UILongPressGestureRecognizer *lo = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longpre:)];
lo.minimumPressDuration = 0.6;
[self.view addGestureRecognizer:lo];
}

%new

- (void)longpre:(UILongPressGestureRecognizer *)longpresss {


NSString *name = self.user.fullName; // Get the Name
NSString *bio = self.user.about;
NSString *follower = self.user.followerCountString;
BOOL following = self.user.followedByMe;
NSDate *getdate = self.user.createdAt;
NSInteger getpin = self.user.pinCount;
NSString *getcountry = self.user.country;
NSDate *getlastPinSaveTime = self.user.lastPinSaveTime;
NSInteger getview = self.user.profileViews;

UIPasteboard *copyname = [UIPasteboard generalPasteboard];

NSString *message = [NSString stringWithFormat:@"The name: %@ \n The Bio: %@ \n The Follower: %@ \n isFollowingYou: %@ \n DateCreated: %@ \n PinCount: %ld \n Country: %@ \n Last Pin Save: %@ \n Views: %ld \n", name, bio, follower, following ? @"YES" : @"NO", getdate, (long)getpin, getcountry, getlastPinSaveTime, (long)getview];

[copyname setString:message];

UIAlertController *alertv = [UIAlertController alertControllerWithTitle:@"INFO ACCOUNT\n" message:message preferredStyle:UIAlertControllerStyleAlert];


UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:nil];

[alertv addAction:ok];


[self presentViewController:alertv animated:YES completion:nil];

}




%end
