#include<fstream>
#include<iostream>
#include<stdlib.h>
#include<string>
#include<stdio.h>
#include<conio.h>
#include<locale.h>
#include "EMPLEADOS.h"
#include "PACIENTES.h"
#include "PRODUCTOS.h"
#include "DUENOS.h"
#include "SERIALIZAR.h"
#include "HUFFMAN.h"


using namespace std;

class Menu
{
public:
    void Menu_Principal();
    void Menu_Paciente();
    void Menu_Dueno();
    void Menu_Empleado();
    void Menu_Producto ();
}m;

class Product
{
	public:
		int posicion=0,codigo=0;
		char nombre[50],marca[50],tipo[50];
		int existencias=0,precio=0;
		void capturar();
		void mostrar_Todo();
		void mostrar_Indice();
		void mostrar_Tipo();
		void mostrar_Marca();
		void buscar_marca(string );
		void buscar_tipo(string );
		void buscar_codigo(int );
		bool confirmar();
		void eliminar();
		void modificar(bool);
		friend class indice;
		friend class subt;
		friend class subm;
}h;

class indice
{
	public:
		int posicion=0;
		int codigo=0;
		char tipo[20];
		char marca[20];
		friend class Product;
}i;

class subt
{
	public:
		int posicion=0;
		int codigo=0;
		char tipo[20];
		friend class Product;
}j;

class subm
{
	public:
		int posicion=0;
		int codigo=0;
		char marca[20];
		friend class Product;
}k;

//------------------------------------------------------------------------------------------------------------------------------------Principal
void Menu::Menu_Principal()
{
    char op;
        do
            {  system("color F0");
                system("cls");
                 cout<<"\n\t\t Veterinaria Pelusa  \n\n\t1.Paciente\n\t2.Dueño \n\t3.Empleado\n\t4.Producto\n\t5.Salir \n\n\t  Seleccione una opción:\t";
                   cin>>op;
                     switch(op)
                     {
                         case '1':
                             system("cls");
                              m.Menu_Paciente();
                            break;

                             case '2':
                                 system("cls");
                                 m.Menu_Dueno();
                            break;

                             case '3':
                                 system("cls");
                                   m.Menu_Empleado();
                            break;

                             case '4':
                                 system("cls");
                                 m.Menu_Producto();
                            break;

                            case '5':
                                system("cls");
                                cout<<"\n\n\tSALIENDO..."<<endl;
                                op=5;
                            break;

                             default:
                             	system("cls");
                                system("Pause");
                            break;
                     }

            }while(op!=5);

}

//----------------------------------------------------------------------------------------------------------------------------Pacientes

void Menu::Menu_Paciente()
{
   char op,op1,op2,op3,op4,op5,mod,otro,cita;
    string c,clave,Dia,Hora;
    string Cod,Nom,R;
    system("color 70 ");
             do
            {
                system("cls");
                cout<<"\n\t\t Menú Paciente\n\n\t 1.Capturar \n\t 2.Mostrar \n\t 3.Buscar \n\t 4.Modificar \n\t 5.Citas \n\t 6.Eliminar \n\t 7.Encriptar y comprimir datos \n\t 8.Regresar\n\n\t  Seleccione una opción:\t";
                fflush(stdin); cin>>op;

                switch(op)
                {
                    case '1':
                        system("cls");
                            do{
                                //d.genera();
                                y.capturar();
                                cout<<"\n\tDesea capturar más Pacientes?   (S/N):\t";
                                cin>>otro;
                                system("cls");
                            }while(otro=='s'||otro=='S');


                    break;

                    case '2':
                            do{
                                system("cls");
cout<<"\n\t\t Menú Mostrar \n\n\t 1.Mostrar pacientes \n\t 2.Mostrar Indice \n\t 3.Mostrar Historial Clínico\n\t 4.Regresar\n\n\t  Seleccione una opción:\t";
                                fflush(stdin); cin>>op1;
                                switch (op1)
                                {
                                case '1':
                                    system("cls");
                                    y.mostrar();
                                    break;

                                case '2':
                                    system("cls");
                                    y.mostrarIND();
                                    break;

                                case '3':
                                	system("cls");
                                	w.mostrarH();
                                	break;

                                case '4':
                                    op1=4;
                                    break;

                                }
                                }while(op1!=4);
                    break;

                    case '3':
                        do{
                                system("cls");
                                cout<<"\n\t\t Menú Búsqueda \n\n\t 1.Buscar por código \n\t 2.Buscar por raza y nombre \n\t 3.Buscar historial clínico \n\t 4.Regresar\n\n\t  Seleccione una opción:\t";
                                cin>>op2;
                                switch (op2)
                                {
                                case '1':
                                    system("cls");
                                    cout<<"\n Ingrese el código a buscar: \t";
                                    cin>>Cod;
                                    system("cls");
                                    y.buscar_codigo(Cod);
                                    system("pause");
                                    break;

                                case '2':
                                    system("cls");
                                    cout<<"\n Ingrese el nombre a buscar: \t";
                                    cin>>Nom;
                                    cout<<"\n Ingrese la raza a buscar:   \t";
                                    cin>>R;
                                    system("cls");
                                    y.buscar_rn(Nom,R);
                                    break;

                                case '3':
                                	system("cls");
                                	char nom[35], raz[20];
                                	cout<<"\n Ingrese el nombre a buscar: \t";
                                    cin>>nom;
                                    cout<<"\n Ingrese la raza a buscar:   \t";
                                    cin>>raz;
                                    system("cls");

                                	w.buscarH(nom, raz);
                                	system("pause");
                                    break;

                                case '4':
                                    op2=4;
                                    break;

                                default:
                                    system("pause");
                                    break;

                                }

                        }while(op2!=4);

                         break;

                    case '4':
                         do{
                                system("cls");
                                cout<<"\n\t\t Menú Modificar \n\n\t 1.Buscar por código  \n\t 2.Buscar por raza y nombre \n\t 3.Regresar\n\n\t  Seleccione una opción:\t";
                                cin>>op3;
                                switch (op3)
                                {
                                case '1':
                                    do{
                                    system("cls");
                                    cout<<"\n\t\t Modificar Por Codigo\n\n\t 1.Edad \n\t 2.Peso \n\t 3.Regresar\n\n\t Seleccione una opción:\t";
                                    cin>>mod;
                                    switch (mod)
                                    {
                                    case '1':
                                        system("cls");
                                        cout<<"\n Ingrese el código a buscar:  \t";
                                        cin>>Cod;
                                        system("cls");
                                        y.modificar_edad(y.buscar_codigo(Cod));
                                        break;
                                    case '2':
                                        system("cls");
                                        cout<<"\n Ingrese el código a buscar:  \t";
                                        cin>>Cod;
                                        system("cls");
                                         y.modificar_peso(y.buscar_codigo(Cod));
                                        break;

                                    case '3':
                                    mod=3;
                                    break;

                                    default:
                                        system("pause");
                                        break;
                                    }
                                    }while(mod!=3);
                                    break;

                                case '2':
                                    do{
                                    system("cls");
                                    cout<<"\n\t\t Modificar Por Raza/Nombre\n\n\t 1.Edad \n\t 2.Peso \n\t 3.Historial Clínico \n\t 4.Regresar\n\n\t  Seleccione una opción:\t";
                                    cin>>mod;
                                    switch (mod)
                                    {
                                    case '1':
                                    system("cls");
                                    cout<<"\n Ingrese el nombre a buscar: \t";
                                    cin>>Nom;
                                    cout<<"\n Ingrese la raza a buscar:   \t";
                                    cin>>R;
                                    system("cls");
                                    y.modificar_edad(y.buscar_rn(Nom,R));
                                    break;

                                    case '2':
                                    system("cls");
                                    cout<<"\n Ingrese el nombre a buscar: \t";
                                    cin>>Nom;
                                    cout<<"\n Ingrese la raza a buscar:   \t";
                                    cin>>R;
                                    system("cls");
                                    y.modificar_peso(y.buscar_rn(Nom,R));
                                        break;
                                    case '3':
                                    	system("cls");
                                    	int mode; bool band;
                                        cout<<"\n\tMenú Modificar Historial Clínico\n\n\t 1.Padeciemiento/Diagnóstico \n\t 2.Medicamento/Tratamiento\n\n\t Ingrese Opción:\t";   fflush(stdin); cin>>mode;
                                    	if(mode==1)
                                    	{
                                    		band=true;
                                    		w.modificarH(band);
										}
										else if(mode==2)
										{
											band=false;
											w.modificarH(band);
										}

                                        break;
                                    case '4':
                                    mod=4;
                                    break;


                                    default:
                                        system("pause");
                                        break;
                                    }
                                    }while(mod!=4);
                                    break;

                                case '3':
                                    op3=3;
                                    break;

                                default:
                                    system("pause");
                                    break;

                                }

                        }while(op3!=3);
                        break;

                    case '5':
                    	do{
                                system("cls");
                                cout<<"\n\t\t Menú Citas \n\t 1.Agendar Cita \n\t 2.Buscar Cita \n\t 3.Modificar Cita \n\t 4.Cancelar Cita \n\t 5.Mostrar Citas \n\t 6.Regresar\n\n\t  Seleccione una opción:\t";
                                fflush(stdin); cin>>op4;
                                switch (op4)
                                {
                                case '1':
                                    system("cls");
                                    y.agendar_cita();

                                    break;

                                case '2':
                                    do{
                                    system("cls");
                                    cout<<"\n\t\t Menú Buscar Citas\n\n\t 1.Buscar por codigo \n\t 2.Buscar por fecha \n\t 3.Regresar\n\n\t  Seleccione una opción:\t";
                                    cin>>cita;
                                    switch (cita)
                                    {
                                    case '1':
                                    system("cls");
                                    cout<<"\n Ingrese el codigo a buscar:    \t";
                                    cin>>Cod;
                                    system("cls");
                                    y.buscar_cita_codigo(Cod);
                                    system("pause");
                                        break;
                                    case '2':
                                    system("cls");
                                    cout<<"\n Ingrese el día a buscar:       \t";
                                    fflush(stdin);
                                    getline(cin,Dia);
                                    cout<<"\n Ingrese la hora a buscar:      \t";
                                    fflush(stdin);
                                    getline(cin,Hora);
                                    system("cls");
                                    y.buscar_cita_fecha(Dia,Hora);
                                        system("pause");
                                        break;
                                    case '3':
                                    	system("cls");
                                    	cita=3;
                                    	break;

                                    default:
                                        system("pause");
                                        break;
                                    }
                                    }while(cita!=3);

                                    break;

                                case '3':
                                    system("cls");
                                    cout<<"\n Ingrese el día a modificar:    \t";
                                    fflush(stdin);
                                    getline(cin,Dia);
                                    cout<<"\n Ingrese la hora a modificar:   \t";
                                    fflush(stdin);
                                    getline(cin,Hora);
                                    system("cls");
                                    y.modificar_cita(y.buscar_cita_fecha(Dia,Hora));
                                        system("pause");
                                    break;

                                case '4':
                                    system("cls");
                                    cout<<"\n Ingrese el día a cancelar:    \t";
                                    fflush(stdin);
                                    getline(cin,Dia);
                                    cout<<"\n Ingrese la hora a cancelar:   \t";
                                    fflush(stdin);
                                    getline(cin,Hora);
                                    system("cls");
                                    y.cancelar_cita(y.buscar_cita_fecha(Dia,Hora));
                                        system("pause");
                                    break;
                                case '5':
                                	system("cls");
                                	y.mostrar_cita();
                                	system("pause"); system("cls");
                                	break;
                                	
                                case '6':
                                	system("cls"); op4=6;
                                	break;

                                default:
                                    system("pause");
                                    break;

                                }

                        }while(op4!=6);
 					break;

                    case '6':
                        do{
                                system("cls");
                                cout<<"\n\t\t Menú Eliminar \n\n\t 1.Buscar por código \n\t 2.Buscar por raza y nombre\n\t 3.Eliminar Historial Clínico\n\t 4.Regresar \n\n\t  Seleccione una opción:\t";
                                cin>>op2;
                                switch (op2)
                                {
                                case '1':
                                    system("cls");
                                    cout<<"\n Ingrese el código a Eliminar: \t";
                                    cin>>Cod;
                                    system("cls");
                                    y.eliminar(y.buscar_codigo(Cod));

                                    break;

                                case '2':
                                    system("cls");
                                    cout<<"\n Ingrese el nombre a Eliminar: \t";
                                    cin>>Nom;
                                    cout<<"\n Ingrese la raza a Eliminar:   \t";
                                    cin>>R;
                                    system("cls");
                                    y.eliminar(y.buscar_rn(Nom,R));
                                    break;

                                case '3':
                                	w.eliminarH();
                                	break;

                                case '4':
                                    system("cls");
                                    op4=4;
                                    break;

                                default:
                                	system("cls");
                                    system("pause");
                                    break;

                                }
                        }while(op4!=4);
                                        break;
                    case '7':
                            buildHuffmanTree(y.concatenar());
                            system("pause");
                      break;

                      case '8':
                      system("cls");
                      op=8;

                    break;


                    default:
                       system("pause");
                            break;

                }



             }while(op!=8);


}

//----------------------------------------------------------------------------------------------------------------------------Dueño

void Menu::Menu_Dueno()
{
    char op,otro;
    string ID,clave;
     string Cod;
    system("color 3F ");
             do
             {
                system("cls");
                cout<<"\n\t\t Menú Dueno\n\n\t 1.Mostrar \n\t 2.Buscar \n\t 3.Modificar \n\t 4.Eliminar \n\t 5.Serializar Datos\n\t 6.Regresar \n\n\t  Seleccione una opción:\t";
                cin>>op;

                switch(op)
                {
                    case '1':
                        D.MostrarD();
                    break;

                    case '2':
                        cout<<"\n\t\tIngrese ID a Buscar\n";
                        cin>>ID;
                        D.BuscarD(ID);
                    break;

                    case '3':
                        cout<<"\n\t\tIngrese ID a Modificar\n";
                        cin>>ID;
                        D.ModificarDT(ID);
                        break;

                    case '4':
                        cout<<"\n\t\tIngrese ID a Eliminar\n";
                        cin>>ID;
                        D.EliminarD(ID);
                        break;

                    case '5':
                        D.SerializarD(); system("pause"); system("cls");
                        break;

                    case '6':
                      op=6;
                    break;


                    default:
                        cout<<"\nIngrese Codigo:\t";
                            break;

                }



             }while(op!=6);




}

//----------------------------------------------------------------------------------------------------------------------------Empleado

void Menu::Menu_Empleado()
{
    char op,otro;
    string c,clave;
     string Cod;
    system("color 3F ");
             do
             {
                system("cls");
                cout<<"\n\t\t Menú Empleado\n\n\t 1.Capturar \n\t 2.Mostrar \n\t 3.Buscar \n\t 4.Modificar \n\t 5.Eliminar \n\t 6.Regresar\n\n\t  Seleccione una opción:\t";
                cin>>op;

                switch(op)
                {
                    case '1':     system("cls");

                         cout<<"\nIngrese Clave De Administrador:\t"; fflush(stdin);
                         cin>>clave; system("cls");
                         if(clave=="Pelusa12")
                        {x.capturar();}
                        else
                        {system("pause");}
                    break;

                    case '2':
                        x.mostrar();
                    break;

                    case '3':  system("cls");

                        do{cout<<"\nIngrese Codigo:\t";
                        fflush(stdin);
                        cin>>Cod;
                        system("cls");

                        x.buscar(Cod);
                            cout<<"\n\tDesea buscar mas empleados?   (S/N):\t";
                                cin>>otro;
                                 system("cls");
                        }while(otro=='s'||otro=='S');

                        break;

                    case '4':       system("cls");

                        cout<<"\nIngrese Clave De Administrador:\t"; fflush(stdin);
                            cin>>clave; system("cls");

                         if(clave=="Pelusa12")

                        {
                            do{cout<<"\nIngrese Codigo:\t";
                        fflush(stdin);
                        cin>>Cod;
                        system("cls");

                        x.modificar(Cod);
                            cout<<"\n\tDesea modificar mas empleados?   (S/N):\t";
                                cin>>otro;
                                 system("cls");
                        }while(otro=='s'||otro=='S');}

                        else
                            {system("pause");}
                        break;


                    break;

                    case '5':      system("cls");

                         cout<<"\nIngrese Clave De Administrador:\t"; fflush(stdin);
                            cin>>clave; system("cls");

                         if(clave=="Pelusa12")

                        { do{cout<<"\nIngrese Codigo:\t";
                        fflush(stdin);
                        cin>>Cod;
                        system("cls");

                        x.eliminar(Cod);
                            cout<<"\n\tDesea eliminar mas empleados?   (S/N):\t";
                                cin>>otro;
                                 system("cls");
                        }while(otro=='s'||otro=='S');}

                        else
                            {system("pause");}
                        break;

                    case '6':
                      op=6;
                    break;

                    default:
                        cout<<"\nIngrese Codigo:\t";
                            break;
                }
             }while(op!=6);
}

//----------------------------------------------------------------------------------------------------------------------------Productos

void Menu::Menu_Producto()
{
    char op,opm,opb,cod,ep;
    bool Mod;
    string c,clave;
     string bus;
    system("color 3F ");
             do
             {
                system("cls");
                cout<<"\n\t\t Menú Productos\n\n\t 1.Capturar \n\t 2.Mostrar \n\t 3.Buscar \n\t 4.Modificar \n\t 5.Eliminar \n\t 6.Regresar\n\n\t  Seleccione una opción:\t";
                cin>>op;

                switch(op)
                {

                case '1':
                    h.capturar();
                    break;

                case '2':
                    do{
                        system("cls");
                       cout<<"\n\t\t Menú Mostrar\n\n\t 1.Mostrar Todo \n\t 2.Mostrar Indice \n\t 3.Mostrar Marcas \n\t 4.Mostrar Tipo de productor \n\t 5.Regresar\n\n\t  Seleccione una opción:\t";
                        cin>>opm;
                    switch(opm)
                    {
                    case '1':
                        h.mostrar_Todo();
                        break;
                    case '2':
                        h.mostrar_Indice();
                        break;
                    case '3':
                        h.mostrar_Marca();
                        break;
                    case '4':
                        h.mostrar_Tipo();
                        break;
                    case '5':
                        opm=5;
                        break;
                    }
                    }while(opm!=5);
                    break;
                case '3':
                     do{
                        system("cls");
                       cout<<"\n\t\t Menú Buscar\n\n\t 1.Buscar por Códico \n\t 2.Buscar por marca \n\t 3.Buscar por tipo de producto \n\t 4.Regresar\n\n\t  Seleccione una opción:\t";
                        cin>>opb;
                    switch(opb)
                    {
                    case '1':
                       system("cls");
                    cout<<"\n\t\tIngrese el Codigo a Buscar\n";
                    cin>>cod;
                    h.buscar_codigo(cod);
                        break;
                    case '2':
                       system("cls");
                    cout<<"\n\t\tIngrese la Marca a Buscar\n";
                    cin>>bus;
                    h.buscar_marca(bus);
                        break;
                    case '3':
                        system("cls");
                    cout<<"\n\t\tIngrese el Tipo de Producto a Buscar\n";
                    cin>>bus;
                    h.buscar_tipo(bus);
                        break;
                    case '4':
                       opb=4;
                        break;
                    }
                    }while(opb!=4);
                    break;
                case '4':
                    cout<<"\n\t\tModificar \n1.Precio \n2.Existencias\n";
				cin>>ep;
				if(ep=='1')
				Mod=true;
				if(ep=='2')
				Mod=false;
				h.modificar(Mod);
				break;

                case '5':
                    h.eliminar();
                    break;
                case '6':
                    op=6;
                    break;
                }
             }while(op!=6);
}

//----------------------------------------------------------------------------------------------------------------------------Main

void Product::capturar()
{
	system("cls");
	int pos=1,ex,pre,cod=1010,c;
	char nom[50],mar[50],ti[50];

		fstream ind ("indi.txt", ios::in|ios::out);
		if(!ind.good())
		pos=1;
		else
		{
			while (!ind.eof())
			{
			ind.read((char*) &i, sizeof(i));
			i.posicion;
			if(ind.eof())
			pos=i.posicion+1;
			}
		}

	cout<<"\nIngresar Nombre:    \t";   fflush(stdin); cin>>nom;
    cout<<"\nIngresar  Marca:\t";   fflush(stdin); cin>>mar;
	cout<<"\nIngresar  Tipo:   \t";   fflush(stdin); cin>>ti;
	cout<<"\nIngresar  Existencias:   \t";   fflush(stdin); cin>>ex;
	cout<<"\nIngresar  Precio : \t";   fflush(stdin); cin>>pre;
		for(int a=0;a<20;a++)
		{
		j.tipo[a]=ti[a];
		i.tipo[a]=ti[a];
		i.marca[a]=mar[a];
		k.marca[a]=mar[a];
		h.nombre[a]=nom[a];
		h.marca[a]=mar[a];
		h.tipo[a]=ti[a];
		h.existencias=ex;
		h.precio=pre;

		}
		i.posicion=pos;
		h.posicion=pos;
		j.posicion=pos;
		k.posicion=pos;
		i.codigo=cod+pos;
		h.codigo=cod+pos;
		j.codigo=cod+pos;
		k.codigo=cod+pos;
	ofstream animales("Producto.txt", ios::app);
	animales.write((char*) &h, sizeof(h));
	animales.close();
	ofstream indice("indi.txt", ios::app);
	indice.write((char*) &i, sizeof(i));
	indice.close();
	ofstream tipo("Tipo.txt", ios::app);
	tipo.write((char*) &j, sizeof(j));
	tipo.close();
	ofstream marca("Marca.txt", ios::app);
	marca.write((char*) &k, sizeof(k));
	marca.close();

	system("pause");
	system("cls");
}



void Product::buscar_marca(string Bus)
{
	system("cls");
	bool bandera=false;
	int con=0;
	char mar[20];
	char busc[Bus.size() + 1];
	strcpy(busc, Bus.c_str());

	bandera=false;

	fstream marca ("Marca.txt", ios::in|ios::out);
	if(!marca.good())
	{
		cout<<"\nError En Archivo\n";
		return;
	}
	else
	{
		while(!marca.eof())
		{
			marca.read((char*) &k, sizeof(k));
			con++;
			if(marca.eof())
			{	break;  }
		    if(strcmp(k.marca,busc)==0)
			{
					bandera=true;
				int a=0;
				fstream indice ("indi.txt", ios::in|ios::out);
				while(a<con)
				{
					indice.read((char*) &i, sizeof(i));
					a++;
				}
				fstream animales("Productos.txt", ios::in|ios::out);
				a=0;
				while(a<i.posicion)
				{
					animales.read((char*) &h, sizeof(h));
					a++;
				}
				cout<<endl;
		     	cout<<"Codigo:  "<<h.codigo<<endl;
		    	cout<<"Nomre:      "<<h.nombre<<endl;
		    	cout<<"Marca:   "<<h.marca<<endl;
			    cout<<"Tipo:    "<<h.tipo<<endl;
			    cout<<"Existencias:      "<<h.existencias<<endl;
			    cout<<"Precio:      "<<h.precio<<endl;
			    cout<<"-------------------------------------------------"<<endl;

			}

		}
		 if(!bandera)
			{			cout<<"\n\tResgistro/Raza No Encontrado\n\n";			}
	}
	system("pause");
	system("cls");
}

void Product::buscar_codigo(int Bus)
{
	bool bandera=false;
	system("cls");
	int ok=0,con=0;
	char mar[20];


	fstream marca ("Marca.txt", ios::in|ios::out);
	if(!marca.good())
	{
		cout<<"\nError En Archivo\n";
	//	return false;
	}
	else
	{
		while(!marca.eof())
		{
			marca.read((char*) &k, sizeof(k));
			if(marca.eof())
			{	break;  }
		    if(k.codigo==Bus)
			{     bandera=true;
		//	return true;
				int a=0;
				fstream indice ("indi.txt", ios::in|ios::out);
				while(a<k.posicion)
				{
					indice.read((char*) &i, sizeof(i));
					a++;
				}
				fstream animales("Producto.txt", ios::in|ios::out);
				a=0;
				while(a<i.posicion)
				{
					animales.read((char*) &h, sizeof(h));
					a++;
				}
				cout<<endl;
		     	cout<<"Codigo:  "<<h.codigo<<endl;
		    	cout<<"Nomre:      "<<h.nombre<<endl;
		    	cout<<"Marca:   "<<h.marca<<endl;
			    cout<<"Tipo:    "<<h.tipo<<endl;
			    cout<<"Existencias:      "<<h.existencias<<endl;
			    cout<<"Precio:      "<<h.precio<<endl;
			    cout<<"-------------------------------------------------"<<endl;
			}

		}
		if(!bandera)
			{			cout<<"\n\tResgistro No Encontrado\n\n";
			       //return false;
				}
	}
	system("pause");
	system("cls");
}

void Product::buscar_tipo(string Bus)
{
	system("cls");
	int ok=0,con=0;
	char mar[20];
	bool bandera=false;
	char busc[Bus.size() + 1];
	strcpy(busc, Bus.c_str());

	fstream tipo ("Tipo.txt", ios::in|ios::out);
	if(!tipo.good())
	{
		cout<<"\nError En Archivo\n";
	}
	else
	{
		while(!tipo.eof())
		{
			tipo.read((char*) &j, sizeof(j));
			j.posicion;
			if(tipo.eof())
			{	break;  }
		    if(strcmp(j.tipo,busc)==0)
			{    bandera=true;
				int a=0;
				fstream indice ("indi.txt", ios::in|ios::out);
				while(a<j.posicion)
				{
					indice.read((char*) &i, sizeof(i));
					i.posicion;
					a++;
				}
				fstream animales("Producto.txt", ios::in|ios::out);
				a=0;
				while(a<i.posicion)
				{
					animales.read((char*) &h, sizeof(h));
					a++;
				}
				cout<<endl;
		     	cout<<"Codigo:  "<<h.codigo<<endl;
		    	cout<<"Nomre:      "<<h.nombre<<endl;
		    	cout<<"Marca:   "<<h.marca<<endl;
			    cout<<"Tipo:    "<<h.tipo<<endl;
			    cout<<"Existencias:      "<<h.existencias<<endl;
			    cout<<"Precio:      "<<h.precio<<endl;
			    cout<<"-------------------------------------------------"<<endl;

			}

		}
		 if(!bandera)
			{			cout<<"\n\tResgistro/Raza No Encontrado\n\n";			}
	}
	system("pause");
	system("cls");
}
void Product::mostrar_Tipo()
{
	system("cls");
	fstream animales ("Tipo.txt", ios::in|ios::out);
	if(!animales.good())
	{
		cout<<"\n\tError En Archivo\n\n";
	}
	else
	{
		while(!animales.eof())
		{
			animales.read((char*) &j, sizeof(j));
			if(animales.eof())
			break;
			cout<<"Posicion:  "<<j.posicion<<endl;
			cout<<"Codigo:  "<<j.codigo<<endl;
			//cout<<"Nombre:      "<<x.nombre<<endl;
			//cout<<"Marca:   "<<w.marca<<endl;
			cout<<"Tipo:      "<<j.tipo<<endl;
			//cout<<"Existencias:    "<<x.existencias<<endl;
			//cout<<"Precio:      "<<x.precio<<endl;
			cout<<"-------------------------------------------------"<<endl;

		}
	}
	system("pause");
	system("cls");
}

void Product::mostrar_Todo()
{
	system("cls");
	fstream animales ("Producto.txt", ios::in|ios::out);
	if(!animales.good())
	{
		cout<<"\n\tError En Archivo\n\n";
	}
	else
	{
		while(!animales.eof())
		{
			animales.read((char*) &h, sizeof(h));
			if(animales.eof())
			break;
			cout<<"Posicion:  "<<h.posicion<<endl;
			cout<<"Codigo:  "<<h.codigo<<endl;
			cout<<"Nombre:      "<<h.nombre<<endl;
			cout<<"Marca:   "<<h.marca<<endl;
			cout<<"Tipo:      "<<h.tipo<<endl;
			cout<<"Existencias:    "<<h.existencias<<endl;
			cout<<"Precio:      "<<h.precio<<endl;
			cout<<"-------------------------------------------------"<<endl;

		}
	}
	system("pause");
	system("cls");
}
void Product::mostrar_Indice()
{
	system("cls");
	fstream animales ("indi.txt", ios::in|ios::out);
	if(!animales.good())
	{
		cout<<"\n\tError En Archivo\n\n";
	}
	else
	{
		while(!animales.eof())
		{
			animales.read((char*) &i, sizeof(i));
			if(animales.eof())
			break;
			cout<<"Posicion:  "<<i.posicion<<endl;
			cout<<"Codigo:  "<<i.codigo<<endl;
			//cout<<"Nombre:      "<<x.nombre<<endl;
			cout<<"Marca:   "<<i.marca<<endl;
			cout<<"Tipo:      "<<i.tipo<<endl;
			//cout<<"Existencias:    "<<x.existencias<<endl;
			//cout<<"Precio:      "<<x.precio<<endl;
			cout<<"-------------------------------------------------"<<endl;

		}
	}
	system("pause");
	system("cls");
}
void Product::mostrar_Marca()
{
	system("cls");
	fstream animales ("Marca.txt", ios::in|ios::out);
	if(!animales.good())
	{
		cout<<"\n\tError En Archivo\n\n";
	}
	else
	{
		while(!animales.eof())
		{
			animales.read((char*) &k, sizeof(k));
			if(animales.eof())
			break;
			cout<<"Posicion:  "<<k.posicion<<endl;
			cout<<"Codigo:  "<<k.codigo<<endl;
			//cout<<"Nombre:      "<<x.nombre<<endl;
			cout<<"Marca:   "<<k.marca<<endl;
			//cout<<"Tipo:      "<<z.tipo<<endl;
			//cout<<"Existencias:    "<<x.existencias<<endl;
			//cout<<"Precio:      "<<x.precio<<endl;
			cout<<"-------------------------------------------------"<<endl;

		}
	}
	system("pause");
	system("cls");
}

bool Product::confirmar()
{
	char confir;
	cout<<"\n\n\tDesea confirmar cambios?   (S/N)\n";
	cin>>confir;
	if((confir=='s')||(confir=='S'))
	return true;
	else if((confir=='n')||(confir=='N'))
	return false;
	else
	{
	system("pause");
	h.confirmar();
	system("cls");
	}
}

void Product::eliminar()
{
	int del;
	bool P=false,I=false,M=false,T=false;
	system("cls");
	cout<<"\n\n\t Ingrese el codigo\n";
	cin>>del;
    h.buscar_codigo(del);

	if(confirmar())
	{

				fstream an("Producto.txt", ios::in|ios::out);
				fstream res("Respaldo Producto.txt", ios::app);
		while(!an.eof())
		{
				an.read((char*) &h, sizeof(h));
			if(an.eof())
			break;
			if(h.codigo!=del)
			{
				if(P)
				h.posicion=h.posicion-1;
				res.write((char*) &h, sizeof(h));
			}
			else if(h.codigo==del)
			P=true;
		}
		fstream ind("indi.txt", ios::in|ios::out);
				fstream resind("Respaldo indi.txt", ios::app);
		while(!ind.eof())
		{
				ind.read((char*) &i, sizeof(i));
			if(ind.eof())
			break;
			if(i.codigo!=del)
			{	if(I)
				i.posicion=i.posicion-1;
				resind.write((char*) &i, sizeof(i));
			}
			else if(i.codigo==del)
			I=true;
		}
		fstream mar("Marca.txt", ios::in|ios::out);
				fstream resmar("Respaldo Marca.txt", ios::app);
		while(!mar.eof())
		{
				mar.read((char*) &k, sizeof(k));
			if(mar.eof())
			break;
			if(k.codigo!=del)
			{	if(M)
				k.posicion=k.posicion-1;
				resmar.write((char*) &k, sizeof(k));
			}
			else if(k.codigo==del)
			M=true;
		}
		fstream tip("Tipo.txt", ios::in|ios::out);
				fstream restip("Respaldo Tipo.txt", ios::app);
		while(!tip.eof())
		{
				tip.read((char*) &j, sizeof(j));
			if(tip.eof())
			break;
			if(j.codigo!=del)
			{	if(T)
				j.posicion=j.posicion-1;
				restip.write((char*) &j, sizeof(j));
			}
			else if(j.codigo==del)
			T=true;
		}

		an.close();
		res.close();
		ind.close();
		resind.close();
		mar.close();
		resmar.close();
		tip.close();
		restip.close();

		remove("Producto.txt");
			remove("indi.txt");
				remove("Marca.txt");
					remove("Tipo.txt");
	rename("Respaldo Producto.txt","Producto.txt");
		rename("Respaldo indi.txt","indi.txt");
			rename("Respaldo Marca.txt","Marca.txt");
				rename("Respaldo Tipo.txt","Tipo.txt");


}  else
{
	system("cls");
	cout<<"\n\n\n\t\t\tCalcelando....\n";
	system("pause");
}

}


void Product::modificar(bool EP)
{
	int del,sumrest,unodos;
	bool P=false,I=false,M=false,T=false;
	system("cls");
	cout<<"\n\n\t Ingrese el codigo\n";
	cin>>del;
    h.buscar_codigo(del);

	if(confirmar())
	{

				fstream an("Producto.txt", ios::in|ios::out);
				fstream res("Respaldo Producto.txt", ios::app);
		while(!an.eof())
		{
				an.read((char*) &h, sizeof(h));
			if(an.eof())
			break;
			if(h.codigo!=del)
			{
				res.write((char*) &h, sizeof(h));
			}
			else if(h.codigo==del)
			{
				if(EP)
				{
					cout<<"\nIngrese Nuevo Precio";
					cin>>h.precio;
					res.write((char*) &h, sizeof(h));
				}
				else if(!EP)
				{
					cout<<"\nIngrese Esxitencias a sumar o restar\n";
					cin>>sumrest;
					cout<<"\n1.Sumar\n2.Restar\n";
					cin>>unodos;
					if(unodos==1)
					h.existencias=h.existencias+sumrest;
					else if(unodos==2)
					h.existencias=h.existencias-sumrest;

					res.write((char*) &h, sizeof(h));
				}
			}
		}


		an.close();
		res.close();

		remove("Producto.txt");
	rename("Respaldo Producto.txt","Producto.txt");

}  else
{
	system("cls");
	cout<<"\n\n\n\t\t\tCalcelando....\n";
	system("pause");
}

}


int main()

{
      w.genera();
      setlocale(LC_ALL,"spanish");
      m.Menu_Principal();
      return 0;
    }
