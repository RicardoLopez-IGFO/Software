#include <iostream>			// Brian Leonardo Navarro Garc�a
#include <stdlib.h>			// Seminario de soluci�n de problemas de Estructura de Datos II
#include <string.h>			// 18-B  Beta-10
#include <math.h>			// Serializaci�n y Deserializaci�n
#include <fstream>

using namespace std;

string convertidorBinario(int ascii){
	string binario = "";

	// Analisis para obtener el n�mero binario
	if(ascii >= 128){
		binario += "1";
		ascii -=128;
	}
	else
		binario += "0";
	if(ascii >= 64){
		binario += "1";
		ascii -=64;
	}
	else
		binario += "0";
	if(ascii >= 32){
		binario += "1";
		ascii -=32;
	}
	else
		binario += "0";
	if(ascii >= 16){
		binario += "1";
		ascii -=16;
	}
	else
		binario += "0";
	if(ascii >= 8){
		binario += "1";
		ascii -=8;
	}
	else
		binario += "0";
	if(ascii >= 4){
		binario += "1";
		ascii -=4;
	}
	else
		binario += "0";
	if(ascii >= 2){
		binario += "1";
		ascii -=2;
	}
	else
		binario += "0";
	if(ascii >= 1){
		binario += "1";
		ascii -=1;
	}
	else
		binario += "0";

	return binario;
}

int decodificadorBinario(string binario){
	int pot = 7, resultado = 0;

	// Convertir el string binario para analizar cada valor
	char *cstr = new char[binario.length() + 1];
	strcpy(cstr, binario.c_str());

	for(int i = 0; i < 8; i++){
		if(cstr[i] == '1'){
			resultado += pow(2,pot);
		}
		pot--;
	}

	return resultado;
}

void serial(string str){
	remove("SocioSerial.txt");

	ofstream ser("SocioSerial.txt", ios::app);
	int ascii;

	// Proceso para convertir el string en un arreglo de char
	int tam = str.length();
	int asc[tam];
	char *cadena = new char[tam + 1];
	strcpy(cadena, str.c_str());

	// Algoritmo para obtener el c�digo ASCII de cada letra
	for(int i = 0; i < tam; i++)
		asc[i] = cadena[i];

	// Conversi�n de cada numero en un c�digo binario de 8 bits
	string bin[tam];
	for(int i = 0; i < tam; i++){
		bin[i] = convertidorBinario(asc[i]);	// Funci�n para obtener el c�digo binario de cada letra
		ser << bin[i] << " ";
	}

}
