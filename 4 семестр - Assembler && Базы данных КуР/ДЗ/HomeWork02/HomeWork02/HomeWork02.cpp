// HomeWork02.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include <algorithm>
#include <iostream>
#include <string>
#include <set>

using namespace std;

string scan(string str) {
    string copy = str, empty, result = "", temp="";

    transform(copy.begin(), copy.end(), copy.begin(), tolower); // переводим в нижний регистр

    // Идентификаторы => I
    set<string> types { 
        "integer", "byte", "word", "real", "double", 
        "string", "shortstring", "boolean", "char"  
    }; // Множество типов в Pascal => T

    set <string> services {
        "procedure", "function", 
        "var", "const"
    }; // Служебные слова в Pascal => P|F|S

    set <char> separators {
       ' ', ':', ';', 
       ',', '(', ')'
    }; // Разделители => в себя
    
    // Удаление пробелов в начале строки
    while (isspace(copy[0])) {
        copy.erase(copy.begin());
    }

    while (copy.length()) {
        if (separators.find(copy[0]) == separators.end()) {
            temp = "";
            int i;
            for (i = 0; i < copy.length() && separators.find(copy[i]) == separators.end(); i++) {
                temp += copy[i];
            }

            if (types.find(temp) != types.end() || services.find(temp) != services.end()) {
                cout << ">> Service word \"" + temp + "\"\n";
                if (services.find(temp) != services.end()) {
                    result += (temp == "procedure") ? "P" : (temp == "function") ? "F" : "S";
                }
                else {
                    result += "T";
                }

                copy.erase(copy.begin(), copy.begin() + i);
            }
            else {
                for (int i = 0; i < temp.length(); i++) {
                    if (i == 0 && !isalpha(temp[0]) && temp[0] != '_' ||
                        i > 0 && !isalpha(temp[i]) && !isdigit(temp[i]) && temp[i] != '_' && temp[i] != '-') {
                            return empty;
                    }
                }

                cout << ">> Identifier \"" + temp + "\"\n";
                result += "I";
                copy.erase(copy.begin(), copy.begin() + i);
            }
        }
        else {
            cout << ">> Service symbol '" << copy[0] << "'\n";
            string sep{ copy[0] };
            result += sep;
            copy.erase(copy.begin());
        }
    }

    return result;
}

bool analyze(string str) {
    // Проверка на корректность подпрограммы
    if (str[0] != 'F' && str[0] != 'P' || str[1] != ' ' || str[2] != 'I') {
        return false;
    }

    // Проверка на подпрограмму
    if (str[0] == 'F' && (str[str.length() - 2] != 'T' || str[str.length() - 3] != ':')) {
        return false;
    }

    // Проверка на процедуру
    if (str[0] == 'P' && str[str.length() - 2] != ')') {
        return false;
    }

    if (str[0] == 'F') {
        cout << ">> Type = function\n";
    }
    else {
        cout << ">> Type = procedure\n";
    }

    // Проверка на скобки
    int pos = str.find(")",4);
    if (str[3] != '(' || pos == -1) {
        return false;
    }

    // Проверка на аргументы
    if (pos > 5) {
        int count = 0;
        string copy = str;
        copy.erase(copy.begin() + pos, copy.end()); // Удаляем все то, что идет после второй скобки со вторым скобкой
        copy.erase(copy.begin(), copy.begin() + 4); // Удаляем все то, что идет до первой скобки включительно
        copy.erase(remove_if(copy.begin(), copy.end(), isspace), copy.end()); // удаление пробелов из строки

        while(copy.length()) {
            if (copy[0] == ';') {
                copy.erase(copy.begin());
            }

            if (copy.length() >= 2 && copy[0] == 'S' && copy[1] == 'I') {
                copy.erase(copy.begin());
            }

            if (copy.length() >= 3 && copy[0] == 'I' && copy[1] == ':' && copy[2] == 'T') {
                count++;
                copy.erase(copy.begin(), copy.begin() + 3);
            }
            else if (copy.length() >= 3 && copy[0] == 'I' && copy[1] == ',' && copy[2] == 'I') {
                count++;
                copy.erase(copy.begin(), copy.begin() + 2);
            }
            else {
                return false;
            }
        }

        cout << ">> Count of parameters: " << count << "\n";
    }
    else {
        cout << ">> No parameters\n";
    }

    return true;
}

bool is_valid(string str) {
    // Лексический анализ
    string result = scan(str);

    // Если строка пустая, то выходим
    if (result.length() == 0) {
        return false;
    }
    cout << "After scan: " << result << "\n";

    // Синтаксический анализ
    return analyze(result);
}

int main() {
    string str;
    cout << "Input strings. To end input \"end\"\n\n";

    while (true) {
        cout << "Input string: \n";
        getline(std::cin, str);

        if (str == "end") {
            break;
        }

        if (is_valid(str)) {
            cout << "----- Your string is valid -----\n\n";
        }
        else {
            cout << "----- Error! Your string is not valid -----\n\n";
        }
    }
}

// Запуск программы: CTRL+F5 или меню "Отладка" > "Запуск без отладки"
// Отладка программы: F5 или меню "Отладка" > "Запустить отладку"

// Советы по началу работы 
//   1. В окне обозревателя решений можно добавлять файлы и управлять ими.
//   2. В окне Team Explorer можно подключиться к системе управления версиями.
//   3. В окне "Выходные данные" можно просматривать выходные данные сборки и другие сообщения.
//   4. В окне "Список ошибок" можно просматривать ошибки.
//   5. Последовательно выберите пункты меню "Проект" > "Добавить новый элемент", чтобы создать файлы кода, или "Проект" > "Добавить существующий элемент", чтобы добавить в проект существующие файлы кода.
//   6. Чтобы снова открыть этот проект позже, выберите пункты меню "Файл" > "Открыть" > "Проект" и выберите SLN-файл.
