#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    double x;
    cout << "Input x: ";
    cin >> x;
    double y = log(x) /pow(cos(x),2) + pow(x, 2) - 5;
    cout << "\ny= " << y<<endl;
    return 0;
}
