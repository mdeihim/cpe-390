#include <iostream>
#include <cmath>
using namespace std;

/*Mourad Deihim
  I pledge my honor that I have abided by the stevens honors system*/

int main() {
    double a,b;
    cout << "Enter a,b: ";
    cin >> a >> b;

    double hypotenuse= sqrt((b*b)+(a*a));
    double area = (a*b*0.5);

    cout<<"The hypotenuse is: "<<hypotenuse<<'\n';
    cout<<"The area is: "<<area;

    return 0;
}
