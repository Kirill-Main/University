#include "spisok.h"
#include <stdlib.h>
#include <string>

spisok::spisok()
{
    first=last=current=nullptr;
}

spisok::~spisok()
{
    current=last;
    while (current!=nullptr)
    {
        if (last!=nullptr)
        {
            last=last->Get_Previous();
            if (last!=nullptr) last->Set_Next(nullptr);
        }

        if (last==nullptr) first=nullptr;

        delete current;
        current=last;
    }

}

void spisok::Add(element *e)
{
    if (first==nullptr)
    {
        first=last=e;
        first->Set_Next(nullptr);
        first->Set_Previous(nullptr);
    }
    else
    {
        e->Set_Next(first);
        e->Set_Previous(nullptr);
        first->Set_Previous(e);
        first=e;
    }

}

bool spisok::Delete(std::string s)
{
    bool result = false;
    if (first->Get_Element() == s)
    {
        current = first->Get_Next();
        current->Set_Previous(nullptr);
        delete first;
        first = current;
        result = true;
    }
    else if (last->Get_Element() == s)
    {
        current = last->Get_Previous();
        current->Set_Next(nullptr);
        delete last;
        last = current;
        result = true;
    }
    else
    {
        current=last;
        while (current!=nullptr)
        {
            if (current->Get_Element() == s)
            {
                element* pr = current->Get_Previous();
                element* n = current->Get_Next();

                pr->Set_Next(n);
                n->Set_Previous(pr);

                delete current;

                result = true;
                break;
            }
            current = current->Get_Previous();
        }
    }

    return result;
}

bool spisok::Delete(float elem)
{
    bool result = false;
    float f = 0;
    float l = 0;

    if (dynamic_cast<real*>(first))
        f = std::stof(first->Get_Element());

    if (dynamic_cast<real*>(last))
        l = std::stof(last->Get_Element());

    if (f == elem)
    {
        current = first->Get_Next();
        current->Set_Previous(nullptr);
        delete first;
        first = current;
        result = true;
    }
    else if (l == elem)
    {
        current = last->Get_Previous();
        current->Set_Next(nullptr);
        delete last;
        last = current;
        result = true;
    }
    else
    {
        current=last;
        while (current!=nullptr)
        {
            float c = 0;

            if (dynamic_cast<real*>(current))
                c = std::stof(current->Get_Element());

            if (c == elem)
            {
                element* pr = current->Get_Previous();
                element* n = current->Get_Next();

                pr->Set_Next(n);
                n->Set_Previous(pr);

                delete current;

                result = true;
                break;
            }
            current = current->Get_Previous();
        }
    }

    return result;
}

std::string spisok::Get_Elements()
{
    std::string result = "Текущее множество состоит из:\n";

    current=last;
    while (current!=nullptr)
    {
        std::string elem = current->Get_Element();

        result+=(elem+" ");

        current = current->Get_Previous();
    }

    return result;
}

std::string new_spisok::find_max_number()
{
    float max = 0;
    std::string res = "", result = "\n\nНаибольшеее число равно: ";

    current=last;
    while (current!=nullptr)
    {
        if (dynamic_cast<real*>(current))
        {
            std::string elem = current->Get_Element();
            float k = std::stof(elem);
            if (k > max) max = k;
        }

        current = current->Get_Previous();
    }

    res = std::to_string(max);
    result += res;

    return result;
}

std::string new_spisok::find_short_string()
{
    int min = 100;
    std::string res = "", result = "\n\nДлина самой короткой строки ", str = "";

    current=last;
    while (current!=nullptr)
    {
        if (dynamic_cast<string*>(current))
        {
            std::string elem = current->Get_Element();
            int k = elem.length();
            if (k < min)
            {
                min = k; str = elem;
            }
        }

        current = current->Get_Previous();
    }

    res = std::to_string(min);
    result += str;
    result += " равна ";
    result += res;

    return result;
}

element::element()
{
    next=previous=nullptr;
}

element* element::Get_Next()
{
    return next;
}

element* element::Get_Previous()
{
    return previous;
}

void element::Set_Next(element *e)
{
    next=e;
}

void element::Set_Previous(element *e)
{
    previous=e;
}

real::real(float n)
{
    number = n;
}

std::string real::Get_Element()
{
    return std::to_string(number);;
}

string::string(std::string s)
{
    str = s;
}

std::string string::Get_Element()
{
    return str;
}
