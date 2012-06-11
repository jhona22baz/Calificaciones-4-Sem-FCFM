#!/user/bin/perl
use DBI;
use CGI;
use Alumno;
# Create the CGI object
my $que = new CGI;

print "Content-type: text/html\n\n";
print <<END_HTML;

END_HTML


my $uno= Alumno->new();

$uno->matricula ($que->param("matriculab"));
$matb= $uno->matricula();




my $conexion = DBI->connect("DBI:mysql:alumno:127.0.0.1","root","1410238yo") or die "no se pudo conectar";

my $manipulador1 = $conexion->prepare(" select * from Alumno where matricula = $matb");
	$manipulador1->execute();

my $xxx= $manipulador1->rows;
	
	if($xxx==0){
	print'<link rel="stylesheet" type="text/css" href="Botones.css" />';
	print '<body>';
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

	print "<center><br/><h3>No se puede borrar un campo inexistente</h3></center>";
	
	}
	else{
	print'<link rel="stylesheet" type="text/css" href="Botones.css" />';
	print '<body>';
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

	print'<h2>';
	print"<center><br/><h3>El siguiente registro ha sido borrado:</h3></br>";	
	print'</h2>';
	printf'<center>';
	print'<h3>';
while(my @arr = $manipulador1->fetchrow_array())

{
	print"@arr ";
	print"</br>";

}
print'</h3>';
printf'</center>';
my $manipulador1 = $conexion->prepare(" delete from Alumno where Matricula = $matb; ");

$manipulador1->execute();

}
$manipulador1->finish();
$conexion->disconnect();
