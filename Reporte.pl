#!/user/bin/perl
use DBI;
use CGI;
use Alumno;
# Create the CGI object
my $q = new CGI;
print "Content-type: text/html\n\n";

my $uno= Alumno->new();

my $conect = DBI->connect("DBI:mysql:alumno:127.0.0.1","root","1410238yo") or die "no se pudo conectar";


my $orden = $conect->prepare(" select * from Alumno Order by Apellido_P; ");

$orden->execute();
print'<link rel="stylesheet" type="text/css" href="Botones.css" />';
print'<body>';
print'<div id="liston">
<div id="dentroliston"><span></span>
<header><h1><b> <center>Alumnos FCFM</center> </b> </header></h1>
</div>
<a href ="Agregar.html"> Agregar</a>
<a href ="Consulta.html">Consulta</a>
<a href ="Borrar.html">Borrar</a>
<a href ="Cambios.html">Cambios</a>
<a href ="Reporte.pl">Reporte</a>
</div>';
print'<div id="reporte">';
print '<TABLE border= "1" align = "center">';
print '<tr> <td>Nombre</td> <td>Apellido Paterno</td> <td>Apellido Materno</td> <td>Matricula</td> <td>Edad</td> <td align= "center">E-mail</td> <td  align= "center">Sexo</td> <td>C1</td> <td>C2</td> <td>C3</td> <td>C4</td> <td>C5</td> <td>C6</td> <td>C7</td></tr>';

while(my @arr = $orden->fetchrow_array()){
print"<tr>";
foreach $datos(@arr)	
 {
	
	print"<td>";    	
	print"$datos";
	print"</td>";
	
 }
	print"</tr>";
}
print '</TABLE>';
print'</div>';
print'</body>';
$orden->finish();
$conect->disconnect();
