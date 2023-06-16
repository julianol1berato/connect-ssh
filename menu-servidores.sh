#!/bin/bash
## dev. Juliano Liberato
## Work Access Contact - Menu Servidores
lista_servidores=servidores.txt

start_program() 
{
	servidores=$(nl $lista_servidores | awk -F' ' 'BEGIN { print "- Servidor" } { print $1, $4 }');
	for (( i=0; i<${#servidores[@]}; i++ ))
	do
    		echo "${servidores[$i]}"
	done
}

connect()
{
ssh root@$IP -p$PORT
}
if [ -z $1 ]; then
start_program
else 
IP=$(head -n$1 $lista_servidores | tail -n1 | awk -F' ' '{print $1}')
PORT=$(head -n$1 $lista_servidores | tail -n1 | awk -F' ' '{print $2}')
connect
fi

