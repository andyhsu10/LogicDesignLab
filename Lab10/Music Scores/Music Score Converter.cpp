//////////////////////////////////////////////////////////////////////////////////
// Name: An-Ting Hsu
// Student ID: 103061207
//
// Create Date:    2015/05/23 02:17:00
// Purpose:    Convert Music Scores
// Project Name:   2015 Spring Logic Design Laboratory Final Project
//
//////////////////////////////////////////////////////////////////////////////////
#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <cstdlib>
#include <ctime>
using namespace std;

#define YEAR_SET 1900
#define MON_SET 1

int main()
{
	int vector_size = 0;
	int ligature_tmp = 0;
	double beat_tmp = 0;
	string filename;
	string note_tmp;

	vector<int> ligature;
	vector<double> beat;
	vector<string> note;

    cout << "Please make sure that the file is going to convert is named as \"data.txt\"!!!" << endl << endl;
    system("pause");
    cout << endl;

	ifstream inFile;
	inFile.open("data.txt");

	if(!inFile){
        cout << "Fail to open the file!!" << endl;
        exit(-1);
    }

    getline(inFile, filename);
    inFile >> ligature_tmp;
    do
	{
		inFile >> beat_tmp;
		inFile >> note_tmp;

		ligature.push_back(ligature_tmp);
		beat.push_back(beat_tmp);
		note.push_back(note_tmp);

        inFile >> ligature_tmp;
    }while(ligature_tmp != -1);

    inFile.close();

    vector_size = ligature.size();

	ofstream outFile;
	outFile.open("music.v");

	if(!outFile){
        cout << "Fail to create the file!!" << endl;
        exit(-1);
    }

    tm *ptrnow;
    time_t loc_now=0, std_now=0;
    time(&loc_now); //seconds from 1970/01/01

    ptrnow = localtime(&loc_now);//get local time

    outFile << "`timescale 1ns / 1ps" << endl;
    outFile << "//////////////////////////////////////////////////////////////////////////////////" << endl;
    outFile << "// Engineer: An-Ting Hsu & Hsin-Ho Lu" << endl << "//" << endl;
    outFile << "// Create Date:    ";

    if((ptrnow -> tm_hour) < 10)
        outFile << "0" << ptrnow -> tm_hour << ":";
    else
        outFile << ptrnow -> tm_hour << ":";
    if((ptrnow -> tm_min) < 10)
        outFile << "0" << ptrnow -> tm_min << ":";
    else
        outFile << ptrnow -> tm_min << ":";
    if((ptrnow -> tm_sec) < 10)
        outFile << "0" << ptrnow -> tm_sec << " ";
    else
        outFile << ptrnow -> tm_sec << " ";
    if((ptrnow -> tm_mon + MON_SET) < 10)
        outFile << "0" << ptrnow -> tm_mon + MON_SET << "/";
    else
        outFile << ptrnow -> tm_mon + MON_SET << "/";
    if((ptrnow -> tm_mday) < 10)
        outFile << "0" << ptrnow -> tm_mday << "/";
    else
        outFile << ptrnow -> tm_mday << "/";
    outFile << ptrnow -> tm_year + YEAR_SET << endl;

    outFile << "// Module Name:    music" << endl;
    outFile << "// Project Name:   2015 Spring Logic Design Laboratory Final Project" << endl;
    outFile << "// Revision:" << endl << "// Revision 0.01 - File Created" << endl << "//" << endl;
    outFile << "// " << filename << endl << "//" << endl;
    outFile << "//////////////////////////////////////////////////////////////////////////////////" << endl;
    outFile << "`include \"global.v\"" << endl;
    outFile << "`define BIT_WIDTH 10" << endl;
    outFile << "module music(" << endl;
    outFile << "\tq0, //shifter output" << endl;
    outFile << "\tclk, // global clock" << endl;
    outFile << "\trst_n //active low reset" << endl << ");" << endl << endl;
	outFile << "//I/Os" << endl;
	outFile << "output [`BIT_WIDTH-1:0] q0; //output" << endl;
	outFile << "input clk, rst_n; //clock & global clock" << endl << endl;

	for(int i=0; i<vector_size; i++){
		if(i%10 == 0)
			outFile << "reg [`BIT_WIDTH-1:0] q" << i << ", ";
		else if(i%10 == 9)
            outFile << "q" << i << ";" << endl;
        else if(i == (vector_size-1))
            outFile << "q" << i << ";" << endl;
		else
			outFile << "q" << i << ", ";
    }

    outFile << endl;
    outFile << "//Sequential logics: Flip Flops" << endl;
	outFile << "always @(posedge clk or negedge rst_n)" << endl;
	outFile << "\tif(~rst_n)" << endl;
    outFile << "\t\tbegin" << endl;

	for(int i=0; i<vector_size; i++){
		outFile << "\t\t\tq" << i << " <= {";

		//Ligatures
		if(ligature[i] == 0)
			outFile << "`LIG_FALSE, ";
		else
			outFile << "`LIG_TRUE, ";

		//Beats
		if(beat[i] == 0.25)
			outFile << "`BEAT_0_25, ";
		else if(beat[i] == 0.3)
			outFile << "`BEAT_0_3, ";
		else if(beat[i] == 0.5)
			outFile << "`BEAT_0_5, ";
		else if(beat[i] == 1)
			outFile << "`BEAT_1, ";
		else if(beat[i] == 1.5)
			outFile << "`BEAT_1_5, ";
		else if(beat[i] == 2)
			outFile << "`BEAT_2, ";
		else if(beat[i] == 3)
			outFile << "`BEAT_3, ";
		else
			outFile << "`BEAT_4, ";

		//Notes
		outFile << "`ENCODE_" << note[i] << "};" << endl;
	}

	outFile << "\t\tend" << endl;
	outFile << "\telse" << endl;
	outFile << "\t\tbegin" << endl;

	for(int i=0; i<vector_size; i++){
		if(i == (vector_size-1))
			outFile << "\t\t\tq" << i << " <= q0;" << endl;
		else
			outFile << "\t\t\tq" << i << " <= q" << i+1 << ";" << endl;
	}

	outFile << "\t\tend" << endl;
	outFile << "endmodule" << endl;

	outFile.close();

    cout << "Convert Finished!!! (In music.v)" << endl << endl;

    system("music.v");
    system("pause");

	return 0;
}
