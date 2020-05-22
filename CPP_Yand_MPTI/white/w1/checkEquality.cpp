#include <iostream>
using namespace std;

int main(){

    int x, y;

    cout << "Input two ints\n";
    cin >> x >> y;

    if (x == y){
        cout << "Equal\n";
    } else {
        cout << "Not equal\n";
    }

    return 0;
}