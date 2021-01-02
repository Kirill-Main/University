#ifndef SPISOK_H
#define SPISOK_H
#include <iostream>

class element
{
private:
    element *next, *previous;
public:
    element();
    virtual ~element() {}
    element* Get_Next();
    element* Get_Previous();
    void Set_Next(element *e);
    void Set_Previous(element *e);
    virtual std::string Get_Element()=0;
};

class integer:public element
{
private:
    int number;
public:
    std::string Get_Element();
    integer(int n);
    ~integer() {}
};

class string:public element
{
private:
    std::string str;
public:
    std::string Get_Element();
    string(std::string s);
    ~string() {}
};

class spisok
{
protected:
    element *first, *last, *current;
public:
    spisok();
    ~spisok();
    void Add(element *e);
    bool Delete(std::string s);
    std::string Get_Elements();
    bool find(std::string s);
};

class new_spisok:public spisok
{
public:
    new_spisok() {};
    std::string multiply_numbers();
};

#endif // SPISOK_H
