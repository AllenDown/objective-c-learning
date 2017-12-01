#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int age;
    int sex;
    @public
    NSString* name;
}

-(Person*)initWithName:(NSString*)initName;
-(void)walk;
@end

@implementation Person
-(void) walk{
    NSLog(@"person can walk");
}
-(Person*)initWithName:(NSString*)initName{
    name = initName;
    return self;
}
@end
int main()
{
    //test class
    Person *person = [[Person alloc] init];
    [person walk];

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    //learning mutableArray
    //create a mutableArray
    NSMutableArray *mArray1 = [NSMutableArray arrayWithCapacity:5];
    [mArray1 addObject:@"aaaa"];
    [mArray1 addObject:@"cccc"];
    NSLog(@"mArray1=%@",mArray1);
    [mArray1 insertObject:@"bbbb" atIndex:1];
    [mArray1 insertObject:@"dddd" atIndex:[mArray1 count]];
    [mArray1 insertObject:@"eeee" atIndex:[mArray1 count]];
    NSLog(@"mArray1 = %@",mArray1);
    //create a dictionary
    NSDictionary *dic1 = [NSDictionary dictionaryWithObject:@"value"forKey:@"key"];
    NSLog(@"dic1:%@",dic1);
    //create dictionary with mutiple objetives
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
        @"value1",@"key1",
        @"value2",@"key2",
        @"value3",@"key3",
        @"value4",@"key4",
        nil];
    NSLog(@"dic2:%@",dic2);

    //create dictionary by existing dictionary
    NSDictionary *dic3 = [NSDictionary dictionaryWithDictionary:dic2];
    NSLog(@"dic3:%@",dic3);

    //get value for specified key
    NSLog(@"key3's value:%@",[dic3 objectForKey:@"key3"]);

    //get counts of dictionary
    NSLog(@"dic3 count:%d",[dic3 count]);

    //get keys of dictionary
    NSArray *keys = [dic3 allKeys];
    NSLog(@"keys:%@",keys);

    //get values of dictionary
    NSArray *values = [dic3 allValues];
    NSLog(@"values:%@",values);

    //mutabledictionary
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc]
    initWithObjectsAndKeys:
       @"mvalue1",@"mkey1",
       @"mvalue2",@"mkey2",nil
    ];

    //adding existing dictionary data
    [mutableDic addEntriesFromDictionary:dic3];
    NSLog(@"mutableDic:%@",mutableDic);

    //adding new key-value into mutableDictionary
    [mutableDic setValue:@"set1" forKey:@"setKey1"];
    NSLog(@"set value for key : %@",mutableDic);

    //using new dictionary replaces the original one
    [mutableDic setDictionary:dic2];
    NSLog(@"set dictionary:%@",mutableDic);

    //delete value by the specified key
    [mutableDic removeObjectForKey:@"key1"];
    NSLog(@"removeForKey:%@",mutableDic);

    //scanner
    NSEnumerator *enumerator = [mutableDic keyEnumerator];
    id key = [enumerator nextObject];
    while(key){
        NSLog(@"enumerators' key:%@,value:%@",key,[mutableDic objectForKey:key]);
        key = [enumerator nextObject];
    }

    //init a set
    NSSet *set1 = [NSSet setWithObjects:@"a",@"b",@"c",@"d",nil];
    NSSet *set2 = [[NSSet alloc] initWithObjects:@"1",@"2",@"3",nil];
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c",nil];
    NSSet *set3 = [NSSet setWithArray:array];

    NSLog(@"set1:%@",set1);
    NSLog(@"set2:%@",set2);
    NSLog(@"set3:%@",set3);

    //get counts of set
    NSLog(@"set1 count:%d",[set1 count]);

    //turn all objects of set into an array
    NSArray *allObj = [set2 allObjects];
    NSLog(@"allObj:%@",allObj);

    //get anyobject of set
    NSLog(@"anyObj:%@",[set3 anyObject]);

    //whether the set contain specified object
    NSLog(@"contains:%d",[set3 containsObject:@"obj2"]);

    //whether the set contain specified set
    NSLog(@"intersect obj:%d",[set1 intersectsSet:set3]);

    //whether two sets totally equal to each other
    NSLog(@"isEqual:%d",[set2 isEqualToSet:set3]);

    //whether the set belongs to specified set
    NSLog(@"isSubSet:%d",[set3 isSubsetOfSet:set1]);

    NSSet *set4 = [NSSet setWithObjects:@"a", @"b", nil];
    NSArray *ary = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", nil];
    NSSet *set5 = [set4 setByAddingObjectsFromArray:ary];
    NSLog(@"addFromArray :%@", set5);

    //create a mutableSet
    NSMutableSet *mutableSet1 = [NSMutableSet setWithObjects:@"1",@"2",@"3",nil];
    NSMutableSet *mutableSet2 = [NSMutableSet setWithObjects:@"a", @"2", @"b", nil];
    NSMutableSet *mutableSet3 = [NSMutableSet setWithObjects:@"1", @"c", @"b", nil];

    //minusSet
    [mutableSet1 minusSet:mutableSet2];
    NSLog(@"minus:%@",mutableSet1);

    //intersectSet
    [mutableSet1 intersectSet:mutableSet3];
    NSLog(@"intersect:%@",mutableSet1);

    //unionSet
    [mutableSet2 unionSet:mutableSet3];
    NSLog(@"union:%@",mutableSet2);

    //remove object of set
    [mutableSet2 removeObject:@"a"];
    NSLog(@"removeObj:%@",mutableSet2);

    //removeAllObjects
    [mutableSet2 removeAllObjects];
    NSLog(@"removeAll:%@",mutableSet2);

    //Learning NSDate
    //show current time
    NSDate *date = [NSDate date];//get current time
    NSLog(@"%@",date);
    //NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //formatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    //NSLog(@"data=%@",[formatter stringFromDate:date]);

    [pool drain];
    return 0;
}
