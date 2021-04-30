#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <string.h>
using namespace std;

int main()
{
    FILE *f, *h;
    char s[BUFSIZ],x,y;
    f = fopen("1.txt","w");
    h = fopen("2.txt", "w");
    printf("Input file f components: ");
    scanf("%s", s);
    for (int i = 0; i < strlen(s); i++)
        fprintf(f,"%c",s[i]);
    fclose(f);
    f = fopen("1.txt", "r");
    fscanf(f, "%c", &x);
    while ((fscanf(f, "%c", &y))!=EOF)
    {
        if (y=='e')
            fprintf(h, "%c", x);
        x = y;
    }
    fclose(f);
    fclose(h);
    f = fopen("1.txt", "r");
    h = fopen("2.txt", "r");
    printf("\n\n");
    printf("File F: ");
    while ((fscanf(f, "%c", &x)) != EOF)
        printf("%c ", x);
    printf("\n");
    printf("File H: ");
    while ((fscanf(h, "%c", &x)) != EOF)
        printf("%c ", x);
    fclose(f);
    fclose(h);
    return 0;
}
