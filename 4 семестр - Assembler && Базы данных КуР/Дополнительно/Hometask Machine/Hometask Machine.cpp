// Hometask Machine.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include <iostream>
#include <iomanip>
#include <vector>

void printMatrix(const std::vector<std::vector<int>>& matrix) {
    std::cout << std::endl;

    for (size_t i = 0; i < matrix.size(); i++) {
        for (size_t j = 0; j < matrix[0].size(); j++) {
            std::cout << std::setw(2) << matrix[i][j] << " ";
        }

        std::cout << std::endl;
    }

    std::cout << std::endl;
}

void inputMachines(std::vector<std::vector<int>>& first, std::vector<std::vector<int>>& second) {
    /* Not equal machines
    first = {
        {1, -1, 0, -1},
        {1, 2, 1, 1},
        {0, -1, 0, -1},
    };

    second = {
        {0, 1, 1, 0},
        {2, -1, 1, -1},
        {0, -1, 1, -1}
    };*/

    /* Equal machines
    first = {
        {1, 0, 0, 1},
        {1, 2, 0, 0},
        {1, 0, 0, 1},
    };

    second = {
        {1, 0, 0, 1},
        {1, 0, 0, 0},
    };*/

    std::cout << std::endl << "Input the number of rows of the first machine: ";
    size_t rows, cols = 4;
    std::cin >> rows;
    first.resize(rows);
    for (size_t i = 0; i < rows; i++) {
        first[i].resize(cols);
        std::cout << "Input the signals fot the " << i << " state else input -1: ";
        std::cin >> first[i][0] >> first[i][1] >> first[i][2] >> first[i][3];
    }

    std::cout << std::endl << "Input the number of rows of the second machine: ";
    std::cin >> rows;
    second.resize(rows);
    for (size_t i = 0; i < rows; i++) {
        second[i].resize(cols);
        std::cout << "Input the signals fot the " << i << " state else input -1: ";
        std::cin >> second[i][0] >> second[i][1] >> second[i][2] >> second[i][3];
    }
    std::cout << std::endl;
}

std::vector<std::vector<int>> createMatrix(const std::vector<std::vector<int>>& first, const std::vector<std::vector<int>>& second) {
    std::vector<std::vector<int>> res(
        first.size() * second.size(),
        std::vector<int>(first[0].size() + 1)
    );

    size_t div = first.size() > second.size() ? second.size() : first.size();
    for (size_t i = 0, j = 0, k = 0; i < res.size(); i++) {
        res[i][0] = k * 10 + (j++ % div);
        if (j % div == 0) {
            k++;
        }
    }

    size_t firstI, secondI;
    for (size_t i = 0; i < res.size(); i++) {
        if (first.size() > second.size()) {
            firstI = res[i][0] / 10, secondI = res[i][0] % 10;
        }
        else {
            firstI = res[i][0] % 10, secondI = res[i][0] / 10;
        }

        if (first[firstI][0] == -1 || second[secondI][0] == -1) {
            res[i][1] = -1;
            res[i][3] = -1;
        }
        else {
            res[i][1] = first[firstI][0] * 10 + second[secondI][0];
            res[i][3] = first[firstI][2] * 10 + second[secondI][2];
        }

        if (first[firstI][1] == -1 || second[secondI][1] == -1) {
            res[i][2] = -1;
            res[i][4] = -1;
        } 
        else {
            res[i][2] = first[firstI][1] * 10 + second[secondI][1];
            res[i][4] = first[firstI][3] * 10 + second[secondI][3];
        }
    }

    std::cout << "After creating matrix" << std::endl;
    printMatrix(res);
    return res;
}

void deleteVertexes(std::vector<std::vector<int>>& matrix) {
    for (size_t i = 1; i < matrix.size(); i++) {
        size_t state = matrix[i][0];

        bool has_found = false;
        for (size_t j = 0; j < matrix.size(); j++) {
            if (i != j && (matrix[j][1] == state || matrix[j][2] == state)) {
                has_found = true;
                break;
            }
        }

        if (!has_found) {
            matrix.erase(matrix.begin() + i);
            i--;
        }
    }

    std::cout << "After deleting vertexes" << std::endl;
    printMatrix(matrix);
}

bool isEqual(const std::vector<std::vector<int>>& matrix) {
    for (size_t i = 0; i < matrix.size(); i++) {
        if (matrix[i][3] != -1 && matrix[i][3] / 10 != matrix[i][3] % 10) {
            return false;
        }
        if (matrix[i][4] != -1 && matrix[i][4] / 10 != matrix[i][4] % 10) {
            return false;
        }
    }

    return true;
}

void start() {
    char ans;
    while (true) {
        std::cout << "Do you want to input machines? (y/n): ";
        std::cin >> ans;
        if (ans == 'n') {
            break;
        }

        std::vector<std::vector<int>> first, second;
        inputMachines(first, second);
        auto matrix = createMatrix(first, second);
        deleteVertexes(matrix);
        std::cout << std::string("Result: machines are ") + (isEqual(matrix) ? "equal" : "not equal") << std::endl << std::endl;
    }
}

int main() {
    start();
    return 0;
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
