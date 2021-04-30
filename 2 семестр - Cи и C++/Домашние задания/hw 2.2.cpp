#include <iostream>
#include <string>
using namespace std;

bool Is_letter(char x)
{
    if ((x >= 'A' && x <= 'Z') || (x >= 'a' && x <= 'z'))
        return true;
    else
        return false;
}

int main()
{
    string s, m;
    int i;
    while (true)
    {
        int k = 0, count = 0;
        bool Is_new_word = true;
        cout << "\n\nInput s: ";
        getline(cin, s);
        m = s;
        if (s[0] == '\0') break;
        i = 0;
        while (s[i] != '\0')
        {
            for (; !Is_letter(s[i]) && s[i] != '\0'; i++)
                ;
            if (s[i] == '\0') break;
            while (Is_letter(s[i]) && s[i] != '\0')
            {
                if (s[i] == 'f' && count < 3 && Is_new_word)
                {
                    k++;
                    Is_new_word = false;
                }
                i++;
            }
            count++;
            Is_new_word = true;
        }
        if (k < 2)
        {
            count = 0;
            i = 0;
            while (s[i] != '\0')
            {
                for (; !Is_letter(s[i]) && s[i] != '\0'; i++)
                    ;
                if (s[i] == '\0') break;
                while (Is_letter(s[i]) && s[i] != '\0')
                {
                    if (s[i] == 'f' && count < 3)
                    {
                        while (Is_letter(s[i]) && i > 0)
                            i--;
                        i++;
                        s[i] = 't';
                        s[i + 1] = 'r';
                        s[i + 2] = 'e';
                        s[i + 3] = 'e';
                        i += 3;
                        int j = i + 1;
                        while (Is_letter(s[j]) && s[j] != '\0')
                            j++;
                        s.erase(i + 1, j - i - 1);
                        break;
                    }
                    i++;
                }
                count++;
            }
        }
        cout << "\nYour s: " << m << endl;
        cout << "Your new s: " << s << endl;
    }
    return 0;
}
