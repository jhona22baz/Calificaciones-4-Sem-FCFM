#!/user/bin/perl
use DBI;
use CGI;
use Alumno;
my $query = new CGI;
print "Content-type: text/html\n\n";
print <<END_HTML;

END_HTML

my $uno= Alumno->new();
$uno->nombre($query->param("mnombre"));
$uno->apellidop($query->param("mapellidop"));
$uno->apellidom ($query->param("mapellidom"));
$uno->matricula ($query->param("mmatricula"));
$uno->edad ($query->param("medad"));
$uno->email ($query->param("mcorreo"));
$uno->sexo ($query->param("msexo"));

$uno->materia1 ($query->param("mmateria1"));
$uno->materia2 ($query->param("mmateria2"));
$uno->materia3 ($query->param("mmateria3"));
$uno->materia4 ($query->param("mmateria4"));
$uno->materia5 ($query->param("mmateria5"));
$uno->materia6 ($query->param("mmateria6"));
$uno->materia7 ($query->param("mmateria7"));

$nompl=$uno->nombre();
$matpl =$uno->matricula();
$nompl=$uno->nombre();
$apellP =$uno->apellidop();
$apellM=$uno->apellidom();
$edadpl=$uno->edad();
$emailpl=$uno->email();
$sexpl =$uno->sexo();

$mpl1=$uno->materia1();
$mpl2=$uno->materia2();
$mpl3=$uno->materia3();
$mpl4=$uno->materia4();
$mpl5=$uno->materia5();
$mpl6=$uno->materia6();
$mpl7=$uno->materia7();

my $conexion = DBI->connect("DBI:mysql:alumno:127.0.0.1","root","1410238yo") or die "no se pudo conectar";


my $manipulador = $conexion->prepare("UPDATE Alumno SET nombre='$nompl',apellido_p ='$apellP',apellido_m ='$apellM', edad=$edadpl,email='$emailpl',sexo='$sexpl' ,materia1=$mpl1, materia2=$mpl2, materia3=$mpl3, materia4=$mpl4, materia5=$mpl5, materia6=$mpl6, materia7=$mpl7 WHERE matricula=$matpl");

$manipulador->execute();
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

print'</br></br>';
print'<center>';
print'<h2>';
print"</br></br>Se ha Cambiado su registro de el Alumno con matricula $matpl..........";
print'</h2>';
print'</center>';
print"</body>";
$manipulador->finish();

$conexion->disconnect();



