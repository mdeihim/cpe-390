#include <iostream>
using namespace std;

/*Mourad Deihim
  I pledge my honor that I have abided by the stevens honors system*/

int main() {

    //count from 1 to 10
    int sum=0;
    for(int i=0;i<10;i++){
        sum+=1;
        cout<<sum<<" ";
    }
    cout<<'\n';

    //count from 10 to 0 backwards
    sum=10;
    for(int i=0;i<=10;i++){
        cout<<sum<<" ";
        sum--;
    }
    cout<<'\n';

    //Count from 0 to 10 by 2
    sum=0;
    for(int i=0;i<=5;i++){
        cout<<sum<<" ";
        sum+=2;
    }
    cout<<'\n';

    //double from 1 to 1024
    sum=1;
    for(int i=0;i<=10;i++){
        cout<<sum<<" ";
        sum*=2;
    }
}
