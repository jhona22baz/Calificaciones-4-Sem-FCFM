#!/user/bin/perl
use strict;
use warnings;
package Alumno;

sub new 
{
my $this = shift;
my $class= ref($this)||$this;
my $self={};
$self->{nombre} = undef;
$self->{matricula} =undef;
$self->{apellidop} =undef;
$self->{apellidom} =undef;
$self->{edad} =undef;
$self->{email} =undef;
$self->{sexo} =undef;
$self->{materia1} =undef;
$self->{materia2} =undef;
$self->{materia3} =undef;
$self->{materia4} =undef;
$self->{materia5} =undef;
$self->{materia6} =undef;
$self->{materia7} =undef;

bless $self, $class; 
     return ($self); 

}
sub nombre{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{nombre}=shift if (@_);

       #Devolvemos el nombre
       return $self->{nombre};
  }
sub matricula{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{matricula}=shift if (@_);

       #Devolvemos el nombre
       return $self->{matricula};
  }
sub apellidop{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{apellidop}=shift if (@_);

       #Devolvemos el nombre
       return $self->{apellidop};
  }
sub apellidom{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{apellidom}=shift if (@_);

       #Devolvemos el nombre
       return $self->{apellidom};
  }
sub edad{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{edad}=shift if (@_);

       #Devolvemos el nombre
       return $self->{edad};
  }

sub email{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{email}=shift if (@_);

       #Devolvemos el nombre
       return $self->{email};
}

sub sexo{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{sexo}=shift if (@_);

       #Devolvemos el nombre
       return $self->{sexo};
  }

sub materia1{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{materia1}=shift if (@_);

       #Devolvemos el nombre
       return $self->{materia1};
  }

sub materia2{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{materia2}=shift if (@_);

       #Devolvemos el nombre
       return $self->{materia2};
  }

sub materia3{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{materia3}=shift if (@_);

       #Devolvemos el nombre
       return $self->{materia3};
  }

sub materia4{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{materia4}=shift if (@_);

       #Devolvemos el nombre
       return $self->{materia4};
  }

sub materia5{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{materia5}=shift if (@_);

       #Devolvemos el nombre
       return $self->{materia5};
  }

sub materia6{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{materia6}=shift if (@_);

       #Devolvemos el nombre
       return $self->{materia6};
  }

sub materia7{
       my $self=shift; #El primer parámetro de un metodo es la  clase
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{materia7}=shift if (@_);

       #Devolvemos el nombre
       return $self->{materia7};
  }

sub DESTROY {
        my $self=shift; #El primer parámetro de un metodo es la  clase
        delete ($self->{nombre});  
        delete ($self->{matricula});
        delete ($self->{apellidop});    
        delete ($self->{apellidom});  
        delete ($self->{edad});  
        delete ($self->{email});  
        delete ($self->{sexo});  
        delete ($self->{materia1}); 
        delete ($self->{materia2}); 
        delete ($self->{materia3}); 
        delete ($self->{materia4}); 
        delete ($self->{materia5}); 
        delete ($self->{materia6}); 
        delete ($self->{materia7});  

  }



 1;


