all: deterministicQuickSort randomizedQuickSort


deterministicQuickSort: QuickSort.cpp 

	g++ -g QuickSort.cpp -o deterministicQuickSort 


randomizedQuickSort: randomizedQuickSort.cpp

	g++ -g randomizedQuickSort.cpp -o randomizedQuickSort 

clean:
	rm deterministicQuickSort randomizedQuickSort
