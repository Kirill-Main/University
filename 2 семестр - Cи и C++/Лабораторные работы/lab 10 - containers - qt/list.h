#ifndef LIST_H
#define LIST_H

#include <iostream>

class Element
{
private:
    Element *next, *previous;
public:
    Element();
    virtual ~Element() {}
    Element* get_next();
    Element* get_previous();
    void set_next(Element *e);
    void set_previous(Element *e);
    virtual std::string get_element() = 0;
};

class Real:public Element
{
private:
    float number;
public:
    Real(float n) : number(n) {};
    ~Real() {}
    std::string get_element();
};

class String:public Element
{
private:
    std::string str;
public:
    String(std::string s) : str(s) {};
    ~String() {}
    std::string get_element();
};

class List
{
protected:
    Element *first, *last, *current;
public:
    List();
    ~List();
    void add(Element *e);
    bool delete_string(std::string s);
    bool delete_number(float elem);
    std::string get_elements();
};

class NewList:public List
{
public:
    NewList() {};
    std::string find_max_number();
    std::string find_short_string();
};

#endif // LIST_H
