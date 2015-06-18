#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
using namespace std;

void convert(string a);

int main()
{
	string code;
	ifstream inFile;
	inFile.open("data.txt");

	if(!inFile){
		cout << "Input file \"BitFont.txt\" is not valid." << endl << endl;
		exit(-1);
	}

	getline(inFile, code);
	do
	{
	    convert(code);
		getline(inFile, code);
		cout << endl << endl;
	}while(!code.empty());

	inFile.close();

	return 0;
}

void convert(string a)
{
	for(int i=0; i<a.size(); i++){
			switch(a[i])
			{
				case '0': cout << "        "; break;
				case '1': cout << "      0 "; break;
				case '2': cout << "    0   "; break;
				case '3': cout << "    0 0 "; break;
				case '4': cout << "  0     "; break;
				case '5': cout << "  0   0 "; break;
				case '6': cout << "  0 0   "; break;
				case '7': cout << "  0 0 0 "; break;
				case '8': cout << "0       "; break;
				case '9': cout << "0     0 "; break;
				case 'a': cout << "0   0   "; break;
				case 'b': cout << "0   0 0 "; break;
				case 'c': cout << "0 0     "; break;
				case 'd': cout << "0 0   0 "; break;
				case 'e': cout << "0 0 0   "; break;
				case 'f': cout << "0 0 0 0 "; break;
			}

			if(i % 5 == 4)
				cout << endl;
		}
}
