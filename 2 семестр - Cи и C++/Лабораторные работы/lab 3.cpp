#include <iostream>
using namespace std;

int main()
{
    unsigned long x, y, A, A1, c, c1, k10, n;
    bool is_here;
    cout << "Input A: ";
    cin >> A;
    x = y = 0;
    k10 = 1;
    n = 0;
    is_here = false;
    A1 = A;
    while (A != 0)
    {
        c = A % 10;
        while (x != 0)
        {
            c1 = x % 10;
            if (c1 == c)
            {
                is_here = true;
                break;
            }
            x /= 10;
        }
        x = y;
        if (!is_here)
        {
            x += (c * k10);
            k10 *= 10;
        }
        y = x;
        is_here = false;
        A /= 10;
    }
    while (x != 0)
    {
        n++;
        x /= 10;
    }
    cout << "\nIn the number "<<A1<<" there are " << n << " different digits\n";
    return 0;
}
