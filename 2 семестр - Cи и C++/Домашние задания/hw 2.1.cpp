#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

bool Is_happy(int x)
{
    string s = to_string(x);
    if (s.length() < 6)
    {
        reverse(s.begin(), s.end());
        for (int i = s.length(); i < 6; i++)
            s += string("0");
        reverse(s.begin(), s.end());
    }
    int k = int(s[0]) + int(s[1]) + int(s[2]);
    int k1 = int(s[3]) + int(s[4]) + int(s[5]);
    if (k == k1)
        return true;
    else
        return false;
}

int main()
{
    int n;
    cout << "Input n: ";
    cin >> n;
    for (int i = 0; i <= n; i++)
        if (Is_happy(i))
            cout << "Number " << i << " is happy"<<endl;
    return 0;
}
