#include <iostream>
#include <string>
using namespace std;

bool is_vowel(char x)
{
    string VOWEL= "AEIOUY";
    string vowel = "aeiouy";
    for (int i = 0; vowel[i]!='\0'; i++)
        if (x == vowel[i] || x == VOWEL[i])
            return true;
    return false;
}

struct spisok
{
    string slovo;
    spisok *next, *pred;
};

int main()
{
    int k = 0, k1 = 0, i = 0,j;
    string s,m;
    spisok *first, *f, *q, *last;
    first = new spisok;

    first->pred = nullptr;
    cout << "Input s: ";
    getline(cin, s);
    m = "";

    while (!isspace(s[i]))
    {
        m += s[i];
        i++;
    }

    first->slovo = m;
    m = "";
    q = new spisok;

    first->next = q;
    f = first;
    i++;
    for (j = i; s[j]!='\0'; j++)
        if (s[j] != ' ')
            m += s[j];
        else
        {
            q->slovo = m;
            q->pred = f;
            m = "";
            f = q;
            q = new spisok;
            f->next = q;
        }
    q->slovo = m;
    q->pred = f;
    m = "";
    q->next = nullptr;
    f = q;

    last = f;
    f = first;
    cout << endl;
    cout << "Spisok: ";
    while (f!=nullptr)
    {
        cout << f->slovo << " ";
        f = f->next;
    }
    f = first;
    cout << endl;
    cout << "Words that start with vowel: ";
    while (f != nullptr)
    {
        if (is_vowel((f->slovo)[0]))
        {
            k++;
            cout << f->slovo << " ";
        }
        f = f->next;
    }
    cout << endl;
    cout << "Count: " << k << endl;
    f = first;
    cout << "Words that end with consonant: ";
    while (f != nullptr)
    {
        if (!is_vowel((f->slovo)[(f->slovo).length()-1]))
        {
            cout << f->slovo << " ";
            k1++;
        }
        f = f->next;
    }
    cout << endl;
    cout << "Count: " << k1 << endl;

    f = first;
    while (f != nullptr)
    {
        q = f->next;
        delete f;
        f = q;
    }

    return 0;
}
