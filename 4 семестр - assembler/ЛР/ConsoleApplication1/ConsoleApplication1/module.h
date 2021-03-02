#pragma once

extern void __stdcall print(char c)
{
	static bool isFirst = true;
	if (!isFirst)
	{
		static int i = 1;
		printf("Iteration = %d, Symbol = '%c'\n", i, c);
		i++;
	}
	isFirst = false;
}