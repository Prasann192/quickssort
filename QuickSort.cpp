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

/* WRITE YOUR IMPLEMENTATION OF DETERMINISTIC QUICK SORT HERE.
NOTE THAT IN DETERMINISTIC QUICK SORT, THE PIVOT IS CHOSEN FROM A FIXED LOCATION IN THE ARRAY
(TYPICALLY THE LAST ELEMENT).
*/
void quickSort(int arr[], int low, int high)
{
	if(low>=high)
		return;
	int i=low, j=high-1, p=arr[high]; 
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
	arr[high]=arr[i];
	arr[i]=p;
	quickSort(arr, low, i-1);
	quickSort(arr, i+1, high);
}

/* DO NOT CHANGE THIS CODE */
int main()
{
	ifstream input_file("input.txt");
	ofstream output_file("output.txt");

	int N;


	if (! input_file.is_open())
		return 1;

	input_file >> N;

	int arr[N];
	int i = 0;

	while (input_file.good())
		input_file >> arr[i++];

	input_file.close();

	auto t1 = high_resolution_clock::now();
	quickSort(arr, 0, N-1);
	auto t2 = high_resolution_clock::now();

	for (int i = 0; i < N; i++)
		output_file << arr[i] << " ";

	/* Getting number of milliseconds as an integer. */
	auto ms_int = duration_cast<microseconds>(t2 - t1);

	cout << ms_int.count();

	return 0;
}
