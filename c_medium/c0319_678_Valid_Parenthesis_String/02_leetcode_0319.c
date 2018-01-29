/*
	Given an array of integers, return indices of the two numbers such that they add up to a specific target.
	You may assume that each input would have exactly one solution, and you may not use the same element twice.

	Example:
	Given nums = [2, 7, 11, 15], target = 9,
	Because nums[0] + nums[1] = 2 + 7 = 9,
	return [0, 1].
*/

#if 0/* Function Declaration and Function Prototypes on leetcode */
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* twoSum(int* nums, int numsSize, int target) {

}
#endif



#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include<time.h>


#include<limits.h>
#include<math.h>



/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* twoSum(int* nums, int numsSize, int target) {
	/* sanity check */
	int *p = NULL;








	return p;
}


void printTime(void)
{
	/* sanity check */
	time_t rawtime;
	struct tm * timeinfo;

	time ( &rawtime );
	timeinfo = localtime ( &rawtime );
	printf ( "\n 当前本地时间为: %s\n", asctime (timeinfo) );
}


int main( int argc, char *argv[] )
{
	/* sanity check */
	printf("\n[%s]%s : %d, enter \n\n",  __TIME__" "__DATE__, __FILE__, __LINE__);
	printTime();

	time_t start,end;
	start=time(NULL);


	/* add your codes here */












	int i = 0;
	for(i=0;i<0xCFFFFFFF;i++)
	{
		//printf("*");  /* 返回两个time_t型变量之间的时间间隔 */
		asm("nop ; nop ; nop ; nop");
	}

















	end=time(NULL);

	/* 输出执行时间 */
	printf("\n 时间间隔为 %6.3f\n\n",difftime(end,start));
	printTime();



	printf("\n[%s]%s : %d, leave \n\n",  __TIME__" "__DATE__, __FILE__, __LINE__);
	return 0;
}
