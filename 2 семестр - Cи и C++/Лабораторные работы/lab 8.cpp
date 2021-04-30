#include <iostream>
using namespace std;

class Ring
{
protected:
    double mass;
    string name;
    double prob;
public:
    void init(string n, double p, double m);
    void print();
    double ProbtoMas();
};

class Signet : public Ring
{
private:
    double massstone;
    string namestone;
public:
    void init(string n, double p, double m, double masss, string names);
    void print();
    double fullmass();
};

void Ring::init(string n, double p, double m)
{
    mass = m;
    name = n;
    prob = p;
}

void Ring::print()
{
    cout << "Name = " << name << endl;
    cout << "Mass = " << mass << endl;
    cout << "Mass of jewel = " << ProbtoMas() << endl;
    cout << "Prob = " << prob << endl;
}

double Ring::ProbtoMas()
{
    return (prob*mass*1.0)/10000;
}

void Signet::init(string n, double p, double m, double masss, string names)
{
    Ring::init(n, p, m);
    massstone = masss;
    namestone = names;
}

void Signet::print()
{
    Ring::print();
    cout << "Name of stone = " << namestone << endl;
    cout << "Mass of stone = " << massstone << endl;
    cout << "Full mass = " << fullmass() << endl;
}

double Signet::fullmass()
{
    return mass + massstone;
}

int main()
{
    Signet signet;
    string name,name1;
    cout << "Input name: ";
    cin >> name1;
    cout << "Input name of stone: ";
    cin >> name;
    double prob,mass,mass1;
    cout << "Input prob: ";
    cin >> prob;
    cout << "Input mass: ";
    cin >> mass1;
    cout << "Input mass of stone: ";
    cin >> mass;
    signet.init(name1, prob, mass1, mass, name);
    cout << "\n\n";
    signet.print();
    return 0;
}
