#include <iostream>
using namespace std;


// sum the numbers from 1 to n and return the answer
int sum(int n) {

    int tot=0;
    for(int i=0;i<=n; i++){
        tot+=i;
    }

    return tot;

}

// sum the numbers from 1/1 to 1/n and return
float sumReciprocals(int n) {

    float sumRecip=0;
    for(float i=1; i<=n;i++){
        sumRecip+=(1/i);
    }

    return sumRecip;

}

// sum the numbers from 1/n to 1/1 (same as above but reversed) and return
float sumReciprocalsReverse(int n) {
    float sum=0;
    for(float i=n; i>=1; i--){
        sum+=(1/i);
    }
    return sum;

}

int main() {
    cout << sum(100) << '\n';
	cout << sumReciprocals(100) << '\n';
	cout << sumReciprocalsReverse(100) << '\n';
}
