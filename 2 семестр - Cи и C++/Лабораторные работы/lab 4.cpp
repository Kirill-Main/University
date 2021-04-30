#include <iostream>
#include <iomanip>
using namespace std;

void print(int A[][5])
{
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 5; j++)
            cout << setw(4) << A[i][j];
        cout << endl;
    }
    cin.ignore(2, '\n');
}

int main()
{
    setlocale(0, "rus");
    int A[3][5];
    cout << "Введите матрицу: " << endl;
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 5; j++)
            cin >> A[i][j];

    cout << "\n\nИсходная матрица:" << endl;
    print(A);

    cout << endl << "Введите номера строк(0 <= n < 3): ";
    int n1, n2, t;
    cin >> n1 >> n2;

    for (int j = 0; j < 5; j++)
    {
        t = A[n1][j];
        A[n1][j] = A[n2][j];
        A[n2][j] = t;
    }

    cout << "\n\n\nМатрица после преобращзования строк:" << endl;
    print(A);

    cout << "\n\n\nАдреса отрицательных элементов:"<<endl;
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 5; j++)
            if (A[i][j] < 0)
            {
                cout << "Адрес " << A[i][j] << " равен " << &A[i][j] << endl;
                A[i][j] = 0;
            }

    cout << "\n\n\nРезультирующая матрица:" << endl;
    print(A);
    return 0;
}
