#include <iostream>
#include <fstream>
#include <string>
#include <chrono>
using namespace std;
using std::chrono::high_resolution_clock;
using std::chrono::duration_cast;
using std::chrono::duration;
using std::chrono::milliseconds;
using std::chrono::microseconds;

/* WRITE YOUR IMPLEMENTATION OF RANDOMIZED QUICK SORT HERE.
THE PIVOT SHOULD BE CHOSEN FROM A RANDOM LOCATION. YOU CAN USE THE FOLLOWING CODE
TO GET A random VALUE BETWEEN low AND high-1.

srand(time(NULL));
int random = low + rand() % (high - low);

*/



void randQuickSort(int arr[], int low, int high)
{
	if(low>=high)
		return;
	int random = low + rand() % (high - low);
	int i=low, j=high-1, p=arr[random]; 
	while(i<=j){
		while(i<=j && arr[i]<=p)
			i++;
		while(i<=j  && arr[j]>p)
			j--;
		if(i<j){
			int t=arr[i];
			arr[i]=arr[j];
			arr[j]=t;
		}
	}
	arr[random]=arr[i];
	arr[i]=p;
	randQuickSort(arr, low, i-1);
	randQuickSort(arr, i+1, high);

}

/* DO NOT CHANGE THIS CODE */
int main()
{
	ifstream input_file("input.txt");
	ofstream output_file("output.txt");

	int N;
	srand(time(NULL));


	if (! input_file.is_open())
		return 1;

	input_file >> N;

	int arr[N];
	int i = 0;

	while (input_file.good())
		input_file >> arr[i++];

	input_file.close();

	auto t1 = high_resolution_clock::now();
	randQuickSort(arr, 0, N-1);
	auto t2 = high_resolution_clock::now();

	for (int i = 0; i < N; i++)
		output_file << arr[i] << " ";

	/* Getting number of milliseconds as an integer. */
	auto ms_int = duration_cast<microseconds>(t2 - t1);

	cout << ms_int.count();

	return 0;
}
