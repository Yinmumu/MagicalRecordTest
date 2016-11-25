//
//  Person+CoreDataProperties.m
//  
//
//  Created by BluelansMac on 16/11/25.
//
//  This file was automatically generated and should not be edited.
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic name;
@dynamic age;
@dynamic work;

@end
