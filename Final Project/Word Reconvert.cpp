#include <iostream>
#include <string>
using namespace std;

int main()
{
	string code;

	do
	{
		cout << "Enter the codes: ";
		cin >> code;

		for(int i=0; i<code.size(); i++){
			switch(code[i])
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

		cout << endl << endl;
	}while(code != "Exit" && code != "exit" && code != "EXIT");

	return 0;
}
