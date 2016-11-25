//
//  Person+CoreDataProperties.h
//  
//
//  Created by BluelansMac on 16/11/25.
//
//  This file was automatically generated and should not be edited.
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *work;

@end

NS_ASSUME_NONNULL_END
