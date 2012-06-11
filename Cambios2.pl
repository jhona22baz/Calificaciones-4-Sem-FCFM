#!/user/bin/perl
use DBI;
use CGI;
use Alumno;
# Create the CGI object
my $query = new CGI;
print "Content-type: text/html\n\n";

my $uno= Alumno->new();
$uno->matricula ($query->param("mmatricula"));
$matpl =$uno->matricula();
my $conect = DBI->connect("DBI:mysql:alumno:127.0.0.1","root","1410238yo") or die "no se pudo conectar";

my $orden = $conect->prepare(" select * from Alumno where matricula=$matpl");
$orden->execute();
my $xxx= $orden->rows;
	
	if($xxx==0){
	print '<body background-color =teal color="#000" >';
	print "<center><br/><h3>No existe este registro a modificar </h3></font></center>";
	
	}
	else{
	
	while ( my ($nom,$apellp,$apellm,$mat,$edad,$email,$sex,$mat1,$mat2,$mat3,$mat4,$mat5,$mat6,$mat7) = $orden->fetchrow_array()) {
	print'<link rel="stylesheet" type="text/css" href="Botones.css" />';
	print '<body">';
	print "<font color=\"white\">";
	
			print "<form action=Cambios.pl method=post>";
			print "<center>";
			print"<h2>Cambios</h2>";
			print"<center>";
			print"<table >";
			print"<tr > ";
			print"<td> Matricula : </td>";
			print"<td Colspan=1> <input name=mmatricula value=$mat readonly> *</td>";
			print"<tr> <td> Nombre(s) :</td>";
			print"<td Colspan=2> <input  name=mnombre value=$nom> </td>";
			print"<tr> <td> Apellido(s):</td>";
			print"<td Colspan=3> <input  name=mapellidop value=$apellp> </td>";
			print"<td Colspan=3> <input  name=mapellidom value=$apellm> </td>";
			print"<tr> <td> Sexo:</td>";
			print"<td Colspan=3> <input  name=msexo value=$sex> </td>";
			print"<tr> <td> Correo:</td>";
			print"<td Colspan=3> <input  name=mcorreo value=$email> </td>";
			print"<tr> <td> Edad:</td>";
			print"<td Colspan=3> <input  name=medad value=$edad> </td>";


			print"</table >";
			print"</center>";
			print"<h2>Calificaci&oacute;nes</h2>";
			print"<table >";
			print"<tr >";
			print"<th >Materia1</th >";
			print"<th > Materia2 </th >";
			print"<th > Materia3 </th >";
			print"<th > Materia4</th >";
			print"<th > Materia5 </th >";
			print"<th > Materia6 </th >";
			print"<th > Materia </th >";
			print"</tr >";
			
			print"<tr >";
			print"<td ><input name=mmateria1 value=$mat1></td >";
			print"<td ><input name=mmateria2 value=$mat2></td >";
			print"<td ><input name=mmateria3 value=$mat3></td >";
			print"<td ><input name=mmateria4 value=$mat4> </td >";
			print"<td ><input name=mmateria5 value=$mat5> </td >";
			print"<td ><input name=mmateria6 value=$mat6> </td >";
			print"<td ><input name=mmateria7 value=$mat7> </td >";
			print"</tr >";
			
			print"</table >";
		  
		  print"<br/><br /> <br />";
			print '<input name="Submit" value="&#x2714;Enviar" type="submit">';
			print "<h3>* El campo de la matricula no se modifica.</h3>";
			print "</form>";
	
}
	}
			

$orden->finish();
$conect->disconnect() || warn "Fallo al desconectarme de  mysql:project_bio:localhost\n$DBI::errstr\n";

