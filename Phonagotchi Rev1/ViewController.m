//
//  ViewController.m
//  Phonagotchi Rev1
//
//  Created by Jose on 21/6/17.
//  Copyright © 2017 appCat. All rights reserved.
//

#import "ViewController.h"
#import "Cat.h"
#import "Food.h"

@interface ViewController()
@property (weak, nonatomic) IBOutlet UIImageView* catImage;
@property (weak, nonatomic) IBOutlet UIImageView* leftFoodImage;
@property (weak, nonatomic) IBOutlet UIImageView* rightFoodImage;
@property (strong, nonatomic) Food* food;
@property (strong, nonatomic) Cat* cat;
@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.cat = [[Cat alloc] init];
    self.food = [[Food alloc] initWithFood];
    self.leftFoodImage.image = [UIImage imageNamed:@"question_mark"];
    self.rightFoodImage.image = [UIImage imageNamed:@"question_mark"];
}

-(IBAction)petCat:(UIPanGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [sender velocityInView:self.view];
        float speed = sqrtf(powf(velocity.x, 2.0) + powf(velocity.y, 2.0));
        
        if ([self.cat decideIfGrumpy:speed]) {
            self.catImage.image = [UIImage imageNamed:@"grumpy"];
        }
        else {
            self.catImage.image = [UIImage imageNamed:@"sleeping"];
        }
        
        [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(setDefaultCatImage) userInfo:nil repeats:NO];
    }
}

-(void)setDefaultCatImage {
    self.catImage.image = [UIImage imageNamed:@"default"];
}

- (IBAction)setLeftFoodItem:(UITapGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.leftFoodImage.image = self.food.foodImages[arc4random_uniform(28)];
    }

}
- (IBAction)setRightFoodItem:(UITapGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.rightFoodImage.image = self.food.foodImages[arc4random_uniform(28)];
    }
}

- (IBAction)leftFoodItemDragHandler:(UIPanGestureRecognizer*)sender {
    CGPoint panCenter = [sender locationInView:self.view];
    CGRect mouthTarget = CGRectMake(
      self.catImage.bounds.origin.x + self.catImage.bounds.size.width/3 - self.catImage.bounds.size.width/4/2,
      self.catImage.bounds.origin.y + self.catImage.bounds.size.height/2 - self.catImage.bounds.size.height/4/2,
      self.catImage.bounds.size.width/4,
      self.catImage.bounds.size.height/4);
    BOOL foodInMouth = CGRectContainsPoint(mouthTarget, self.leftFoodImage.center);
    
    switch (sender.state) {
        case UIGestureRecognizerStateChanged:
            self.leftFoodImage.center = panCenter;
            break;
        case UIGestureRecognizerStateEnded:
            if (foodInMouth) {
                [UIView animateWithDuration:1.0
                  animations:^{self.leftFoodImage.alpha = 0;}
                  completion:^(BOOL finished) {[self.leftFoodImage removeFromSuperview]; self.leftFoodImage = nil;}
                ];
            }
            else {
                [UIView animateWithDuration:2.0
                 animations:^{self.leftFoodImage.center = CGPointMake(self.leftFoodImage.center.x, CGRectGetMaxY(self.view.frame)); self.leftFoodImage.alpha = 0;}
                 completion:^(BOOL finished) {[self.leftFoodImage removeFromSuperview]; self.leftFoodImage = nil;}
                ];
            }
            break;
            
        default:
            break;
    }
}

- (IBAction)rightFoodItemDragHandler:(UIPanGestureRecognizer*)sender {
    CGPoint panCenter = [sender locationInView:self.view];
    CGRect mouthTarget = CGRectMake(
      self.catImage.bounds.origin.x + self.catImage.bounds.size.width/3 - self.catImage.bounds.size.width/4/2,
      self.catImage.bounds.origin.y + self.catImage.bounds.size.height/2 - self.catImage.bounds.size.height/4/2,
      self.catImage.bounds.size.width/4,
      self.catImage.bounds.size.height/4);
    BOOL foodInMouth = CGRectContainsPoint(mouthTarget, self.rightFoodImage.center);
    
    switch (sender.state) {
        case UIGestureRecognizerStateChanged:
            self.rightFoodImage.center = panCenter;
            break;
        case UIGestureRecognizerStateEnded:
            if (foodInMouth) {
                [UIView animateWithDuration:1.0
                  animations:^{self.rightFoodImage.alpha = 0;}
                  completion:^(BOOL finished) {[self.rightFoodImage removeFromSuperview]; self.rightFoodImage = nil;}
                 ];
            }
            else {
                [UIView animateWithDuration:2.0
                  animations:^{self.rightFoodImage.center = CGPointMake(self.rightFoodImage.center.x, CGRectGetMaxY(self.view.frame)); self.rightFoodImage.alpha = 0;}
                  completion:^(BOOL finished) {[self.rightFoodImage removeFromSuperview]; self.rightFoodImage = nil;}
                 ];
            }
            break;
            
        default:
            break;
    }
}

@end

