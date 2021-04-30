#include <stdlib.h>
#include <string>

#include "list.h"

List::List()
{
    first = last = current = nullptr;
}

List::~List()
{
    current = last;
    while (current != nullptr)
    {
        if (last != nullptr)
        {
            last = last->get_previous();
            if (last != nullptr) last->set_next(nullptr);
        }

        if (last == nullptr) first = nullptr;

        delete current;
        current = last;
    }

}

void List::add(Element *e)
{
    if (first == nullptr)
    {
        first = last = e;
        first->set_next(nullptr);
        first->set_previous(nullptr);
    }
    else
    {
        e->set_next(first);
        e->set_previous(nullptr);
        first->set_previous(e);
        first = e;
    }

}

bool List::delete_string(std::string s)
{
    bool result = false;
    if (first->get_element() == s)
    {
        current = first->get_next();
        current->set_previous(nullptr);
        delete first;
        first = current;
        result = true;
    }
    else if (last->get_element() == s)
    {
        current = last->get_previous();
        current->set_next(nullptr);
        delete last;
        last = current;
        result = true;
    }
    else
    {
        current=last;
        while (current!=nullptr)
        {
            if (current->get_element() == s)
            {
                Element* pr = current->get_previous();
                Element* n = current->get_next();

                pr->set_next(n);
                n->set_previous(pr);

                delete current;

                result = true;
                break;
            }
            current = current->get_previous();
        }
    }

    return result;
}

bool List::delete_number(float elem)
{
    bool result = false;
    float f = 0;
    float l = 0;

    if (dynamic_cast<Real*>(first))
        f = std::stof(first->get_element());

    if (dynamic_cast<Real*>(last))
        l = std::stof(last->get_element());

    if (f == elem)
    {
        current = first->get_next();
        current->set_previous(nullptr);
        delete first;
        first = current;
        result = true;
    }
    else if (l == elem)
    {
        current = last->get_previous();
        current->set_next(nullptr);
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

            if (dynamic_cast<Real*>(current))
                c = std::stof(current->get_element());

            if (c == elem)
            {
                Element* pr = current->get_previous();
                Element* n = current->get_next();

                pr->set_next(n);
                n->set_previous(pr);

                delete current;

                result = true;
                break;
            }
            current = current->get_previous();
        }
    }

    return result;
}

std::string List::get_elements()
{
    std::string result = "Текущее множество состоит из:\n";

    current = last;
    while (current!=nullptr)
    {
        std::string elem = current->get_element();

        result+=(elem+" ");

        current = current->get_previous();
    }

    return result;
}

std::string NewList::find_max_number()
{
    float max = 0;
    std::string res = "", result = "\n\nНаибольшеее число равно: ";

    current = last;
    while (current != nullptr)
    {
        if (dynamic_cast<Real*>(current))
        {
            std::string elem = current->get_element();
            float k = std::stof(elem);
            if (k > max) max = k;
        }

        current = current->get_previous();
    }

    res = std::to_string(max);
    result += res;

    return result;
}

std::string NewList::find_short_string()
{
    int min = 100;
    std::string res = "", result = "\n\nДлина самой короткой строки ", str = "";

    current = last;
    while (current != nullptr)
    {
        if (dynamic_cast<string*>(current))
        {
            std::string elem = current->get_element();
            int k = elem.length();
            if (k < min)
            {
                min = k; str = elem;
            }
        }

        current = current->get_previous();
    }

    res = std::to_string(min);
    result += str;
    result += " равна ";
    result += res;

    return result;
}

Element::Element()
{
    next = previous = nullptr;
}

Element* Element::get_next()
{
    return next;
}

Element* Element::get_previous()
{
    return previous;
}

void Element::set_next(Element *e)
{
    next = e;
}

void Element::set_previous(Element *e)
{
    previous = e;
}

std::string Real::get_element()
{
    return std::to_string(number);;
}

std::string String::get_element()
{
    return str;
}
