package EPrints::Plugin::Screen::BlackoutSearch;

@ISA = ("EPrints::Plugin::Screen::Search");

use strict;

sub allow
{
        my( $self, $priv ) = @_;

        return 0 if( !defined $self->{session}->current_user );
        return $self->{session}->current_user->allow( $priv );
}

1;
