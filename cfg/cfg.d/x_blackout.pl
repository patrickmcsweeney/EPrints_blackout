$c->{plugin_alias_map}->{"Screen::Search"} = "Screen::BlackoutSearch";
$c->{plugins}->{"Screen::BlackoutSearch"}->{params}->{disable} = 0;

$c->{public_roles} = [];

$c->add_trigger( EP_TRIGGER_URL_REWRITE, sub {
	my( %o ) = @_;


	if( defined $o{repository}->current_user ) {
		return;
	}

	if( $o{uri} ne $o{urlpath}."/cgi/users/login" )
	{
	      ${$o{return_code}} = EPrints::Apache::Rewrite::redir( $o{request}, $o{urlpath}."/cgi/users/login" );
	      return EP_TRIGGER_DONE;
	}
	#$o{uri} =~ s/^$o{urlpath}\///;

	#if( $o{uri} =~ /^(\d+)\/?$/ || $o{uri} =~ /^eprint\/(\d+)\/?/ )
	#{
	#      ${$o{return_code}} = EPrints::Apache::Rewrite::redir( $o{request}, $o{urlpath}."/cgi/users/home?screen=EPrint::View&eprintid=".$1 );
	#      return EP_TRIGGER_DONE;
	#}
	
	##### TODO Add one of documents in here

} );

