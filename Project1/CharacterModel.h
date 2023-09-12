//
//  ImageModel.h
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

//Yoinky Spoinky your code is mine now

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CharacterModel : NSObject
//TODO look into plist/propertylists
+(CharacterModel*)sharedInstance;
-(UIImage*)getPortWithName:(NSString*)name;
-(UIImage*)getPortWithIndex:(NSInteger)index;
-(NSInteger)numberOfPorts;
-(NSString*)getPortNameForIndex:(NSInteger)index;
-(NSArray*)getClasses;
-(NSArray*)getCharacters;
-(NSInteger)numberOfCharacters;
-(NSDictionary*)getCharacterWithIndex:(NSInteger)index;

-(NSInteger)numberOfWeapons;
-(NSInteger)numberOfArmors;
-(NSInteger)numberOfCybernetics;

-(NSDictionary*)getWeaponWithIndex:(NSInteger)index;
-(NSDictionary*)getArmorWithIndex:(NSInteger)index;
-(NSString*)getCyberneticWithIndex:(NSInteger)index;

-(UIImage *)getWeaponImageFor:(NSString*)name;

@end

NS_ASSUME_NONNULL_END
