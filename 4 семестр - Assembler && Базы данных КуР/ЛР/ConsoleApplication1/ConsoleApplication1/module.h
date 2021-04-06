#pragma once

extern void __stdcall print(char c)
{
	static int i = 1;
	printf("Iteration = %d, symbol = '%c'\n", i, c);
	i++;
}