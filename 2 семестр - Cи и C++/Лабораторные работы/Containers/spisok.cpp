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

bool spisok::find(std::string s)
{
    bool result = false;

    current=last;
    while (current!=nullptr)
    {
        std::string elem = current->Get_Element();

        if (elem == s)
        {
            result = true;
            break;
        }

        current = current->Get_Previous();
    }

    return result;
}

std::string new_spisok::multiply_numbers()
{
    int mult = 1;
    std::string res = "", result = "\n\nПроизведение чисел равно: ";

    current=last;
    while (current!=nullptr)
    {
        if (dynamic_cast<integer*>(current))
        {
            std::string elem = current->Get_Element();
            int k = std::stoi(elem);
            mult*=k;
        }

        current = current->Get_Previous();
    }

    res = std::to_string(mult);
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

integer::integer(int n)
{
    number = n;
}

std::string integer::Get_Element()
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
