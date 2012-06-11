#!/usr/bin/perl

print "Content-type:text/html\n\n";

$log = "count.dat";
open GETCOUNT, "<$log" or die("Error en $0: $log - $!n");
$hits = <GETCOUNT>;
close(GETCOUNT);

$hits++;
print "document.write('$hits')";

open COUNT, ">$log" or dienice("Error al abrir y escribir");
print COUNT $hits;
close COUNT;