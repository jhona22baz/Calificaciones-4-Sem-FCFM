#!/user/bin/perl
use DBI;
use CGI;
use Alumno;
# Create the CGI object
my $q = new CGI;

print "Content-type: text/html\n\n";
print <<END_HTML;

END_HTML

my $uno= Alumno->new();

$uno->matricula ($q->param("mmatricula1"));
$mat1 = $uno->matricula();
my $mat2 =$q->param("mmatricula2");



my $conexion = DBI->connect("DBI:mysql:alumno:127.0.0.1","root","1410238yo") or die "no se pudo conectar";


my $manipulador = $conexion->prepare(" select * from Alumno where Matricula >= $mat1 and Matricula <= $mat2; ");
$manipulador->execute();
my $xxx= $manipulador->rows;
	
	if($xxx==0){
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
	print "<center><br/><h3>No coincide la busqueda con algun registro de la Base de Datos</h3></font></center>";
	
	}
	else{

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
</div>';print'<center>';
print'<h2>';
print'Su consulta es:';
print'</h2>';
print'</center>';
print'<div id="reporte">';
print '<TABLE border= "1" align = "center"colr="#4d4d4d" >';
print '<tr> <td>Nombre</td> <td>Apellido Paterno</td> <td>Apellido Materno</td> <td>Matricula</td> <td>Edad</td> <td align= "center">E-mail</td> <td  align= "center">Sexo</td> <td>C1</td> <td>C2</td> <td>C3</td> <td>C4</td> <td>C5</td> <td>C6</td> <td>C7</td></tr>';

while(my @arr = $manipulador->fetchrow_array()){
print"<tr>";
foreach $datos(@arr)	
 {
	
	print"<td>";    	
	print"$datos";
	print"</td>";
	
 }
	print"</tr>";
}
print "</TABLE>";
print"</body>";
}
$manipulador->finish();
$conexion->disconnect();















