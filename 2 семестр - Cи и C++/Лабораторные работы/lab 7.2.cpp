#include <iostream>
using namespace std;

class Tree
{
private:
    int thickness,age;
public:
    Tree(int a, int t) : age(a), thickness(t) {};
    void print();
    double average();
};

void Tree::print()
{
    cout << "Age = " << age <<endl;
    cout << "Thickness = " << thickness << endl;
    cout << "Average = " << average() << endl;
}

double Tree::average()
{
    return (thickness * 1.0) / age;
}

int main()
{
    int a, t;
    cout << "Input age, thickness: ";
    cin >> a >> t;
    Tree tree(a, t);
    cout << endl;
    tree.print();
    return 0;
}
