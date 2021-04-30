#include <iostream>
using namespace std;

class Film
{
private:
    string name;
    double critics_rate, users_rate;
public:
    void init(string n, double c, double u);
    void print();
    double average();
};

class Catalog
{
private:
    int num;
    Film films[30];
public:
    Catalog(int n) : num(n)
    {}
    void init(string n, double c, double u, int i);
    void print();
    void best_worst();
};

void Film::init(string n, double c, double u)
{
    name = n;
    critics_rate = c;
    users_rate = u;
}
void Film::print()
{
    cout << "Name = " << name << endl;
    cout << "Critics rating = " << critics_rate << endl;
    cout << "Users rating = " << users_rate << endl;
    cout << "Average = " << average() << endl;
}

double Film::average()
{
    return (critics_rate + users_rate) * 1.0 / 2.0;
}

void Catalog::init(string n, double c, double u, int i)
{
    films[i].init(n,c,u);
}

void Catalog::print()
{
    for (int i = 0; i < num; i++)
    {
        films[i].print();
        cout << endl;
    }
    cout << "\n\n";
    best_worst();
}

void Catalog::best_worst()
{
    double min = 6, max = -1;
    int best=0, worst=0;
    for (int i = 0; i < num; i++)
    {
        if (films[i].average() > max)
        {
            max = films[i].average();
            best = i;
        }
        if (films[i].average() < min)
        {
            min = films[i].average();
            worst = i;
        }
    }
    cout << "Best Film is: " << endl;
    films[best].print();
    cout << "\nWorst Film is: " << endl;
    films[worst].print();
}

int main()
{
    int n;
    string name;
    double c, u;
    cout << "Input n: ";
    cin >> n;
    Catalog catalog(n);
    for (int i = 0; i < n; i++)
    {
        cout << "Input name: ";
        cin >> name;
        cout << "Input critics rating: ";
        cin >> c;
        cout << "Input users rating: ";
        cin >> u;
        catalog.init(name, c, u, i);
    }
    cout << "\n\n";
    catalog.print();
    return 0;
}
