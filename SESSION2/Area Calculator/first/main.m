//
//  main.m
//  first
//
//  Created by Deepak Kumar on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "shape.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // insert code here...
        float value,value1,value2;
        int choice,ch;
        int array[10],i,no;
        do
        {
            NSLog(@"Hello, Deepak here!");
            
            
            NSLog(@"ENTER YOUR CHOICE, WHICH SHAPES AREA YOU WANT:");
            NSLog(@"1.CIRCLE");
            NSLog(@"2.TRIANGLE");
            NSLog(@"3.RECTANGLE");
            NSLog(@"4.SQUARE");
            NSLog(@"5.RHOMBUS");
            NSLog(@"6.ARRAY OF SHAPES");
            
            printf("Enter a number between 1 and 6: ");
            scanf("%i",&choice);
            
            switch (choice){
                    
                case 1:{
                    NSLog(@"you have selected 1 i.e CIRCLE");
                    NSLog(@"enter the RADIUS of circle :");
                    scanf("%f",&value1);
                    
                    Circle *c1 =[[Circle alloc] init];
                    c1.radius=value1;
                    [c1 calculateArea];
                    
                    break;
                }
                case 2:
                {
                    NSLog(@"you have selected 2 i.e TRIANGLE");
                    NSLog(@"enter the BASE and HEIGHT of the triangle :");
                    scanf("%f%f",&value1,&value2);
                    
                    Triangle *t1=[[Triangle alloc] init];
                    t1.side1=value1;
                    t1.side2=value2;
                    [t1 calculateArea];
                    
                    break;
                }   
                case 3:
                {   
                    NSLog(@"you have selected 3 i.e RECTANGLE ");
                    NSLog(@"enter the LENGTH and BREADTH for rectangle:");
                    scanf("%f%f",&value1,&value2);
                    
                    Rectangle *r1=[[Rectangle alloc] init];
                    r1.side1=value1;
                    r1.side2=value2;
                    [r1 calculateArea];
                    
                    break;
                }
                case 4:
                {
                    NSLog(@"you have selected 4 i.e SQUARE");
                    NSLog(@"enter the SIDE of square :");
                    scanf("%f",&value);
                    
                    Square *s1=[[Square alloc] init];
                    s1.side=value;
                    [s1 calculateArea];
                    
                    break;
                }
                case 5:
                {    
                    NSLog(@"you have selected 5 i.e RHOMBUS");
                    NSLog(@"enter the DIAGONALS of the rhombus :");
                    scanf("%f%f",&value1,&value2);
                    
                    Rhombus *r2=[[Rhombus alloc]init];
                    r2.side1=value1;
                    r2.side2=value2;
                    [r2 calculateArea];
                    
                    break;
                }
                    
                case 6:
                {    
                    NSLog(@"ENTER THE NO OF SHAPES: ");
                    scanf("%i",&no);
                    NSLog(@" \n 1 for circle\n 2 for triangle\n 3 for rectangle\n 4 for square\n 5 for rhombus\n ENTER THE TYPE OF SHAPES :");
                    for (i=0; i<no; i++) {
                        scanf("%i",&array[i]); }
                    
                    for (i=0; i<no; i++) {
                        printf("%i",array[i]);}
                    
                    
                    NSLog(@"CALCULATING area one by one");
                    for(i=0;i<no;i++)
                    {
                        
                        switch(array[i])
                        {
                            case 1:
                                
                            {
                                NSLog(@"you have selected 1 i.e CIRCLE");
                                NSLog(@"enter the RADIUS of circle :");
                                scanf("%f",&value1);
                                
                                Circle *c1 =[[Circle alloc] init];
                                c1.radius=value1;
                                [c1 calculateArea];
                                
                                break;
                            }
                            case 2:
                            {
                                NSLog(@"you have selected 2 i.e TRIANGLE");
                                NSLog(@"enter the BASE and HEIGHT of the triangle :");
                                scanf("%f%f",&value1,&value2);
                                
                                Triangle *t1=[[Triangle alloc] init];
                                t1.side1=value1;
                                t1.side2=value2;
                                [t1 calculateArea];
                                
                                break;
                            }   
                            case 3:
                            {   
                                NSLog(@"you have selected 3 i.e RECTANGLE ");
                                NSLog(@"enter the LENGTH and BREADTH for rectangle:");
                                scanf("%f%f",&value1,&value2);
                                
                                Rectangle *r1=[[Rectangle alloc] init];
                                r1.side1=value1;
                                r1.side2=value2;
                                [r1 calculateArea];
                                
                                break;
                            }
                            case 4:
                            {
                                NSLog(@"you have selected 4 i.e SQUARE");
                                NSLog(@"enter the SIDE of square :");
                                scanf("%f",&value);
                                
                                Square *s1=[[Square alloc] init];
                                s1.side=value;
                                [s1 calculateArea];
                                
                                break;
                            }
                            case 5:
                            {    
                                NSLog(@"you have selected 5 i.e RHOMBUS");
                                NSLog(@"enter the DIAGONALS of the rhombus :");
                                scanf("%f%f",&value1,&value2);
                                
                                Rhombus *r2=[[Rhombus alloc]init];
                                r2.side1=value1;
                                r2.side2=value2;
                                [r2 calculateArea];
                                
                                break;
                            }
                              
                            default :break;
                        }
                        
                        
                    }        
                    
                }
                    
                default:
                    
                    break;
            }
            
            NSLog(@"you want to continue press 1 otherwise 0");
            scanf("%i",&ch);
            
        }while(ch==YES);
        
        
        
        
        return 0;
        
        
    }
}