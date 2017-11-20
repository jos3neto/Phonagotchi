//
//  Food.m
//  Phonagotchi Rev1
//
//  Created by Jose on 26/6/17.
//  Copyright © 2017 appCat. All rights reserved.
//

#import "Food.h"

@implementation Food

-(instancetype)initWithFood
{
    self = [super init];
    if (self) {
        _foodImages = @[
        [UIImage imageNamed:@"acorn"],
        [UIImage imageNamed:@"apple"],
        [UIImage imageNamed:@"broccoli"],
        [UIImage imageNamed:@"burger"],
        [UIImage imageNamed:@"cake"],
        [UIImage imageNamed:@"carrot"],
        [UIImage imageNamed:@"cheese"],
        [UIImage imageNamed:@"cherries"],
        [UIImage imageNamed:@"chicken"],
        [UIImage imageNamed:@"chocolate"],
        [UIImage imageNamed:@"churros"],
        [UIImage imageNamed:@"cookie"],
        [UIImage imageNamed:@"corn"],
        [UIImage imageNamed:@"cupcake"],
        [UIImage imageNamed:@"doritos"],
        [UIImage imageNamed:@"fish"],
        [UIImage imageNamed:@"fries"],
        [UIImage imageNamed:@"hot_dog"],
        [UIImage imageNamed:@"ladybug"],
        [UIImage imageNamed:@"macaron"],
        [UIImage imageNamed:@"orange"],
        [UIImage imageNamed:@"pineapple"],
        [UIImage imageNamed:@"pizza"],
        [UIImage imageNamed:@"sausage"],
        [UIImage imageNamed:@"strawberry"],
        [UIImage imageNamed:@"taco"],
        [UIImage imageNamed:@"tea"],
        [UIImage imageNamed:@"whole_chicken"]
        ];
    }
    return self;
}

@end
