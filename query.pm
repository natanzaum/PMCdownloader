use Bio::DB::EUtilities;

sub queryPMC {
	
	my($termo,$email,$n) = @_;

	my $db = Bio::DB::EUtilities->new(-eutil => 'esearch',
		-db     => 'pmc',
		-term   => @termo,
		-email  => $email,
		-retmax => $n);

print "QUERY: ",$db->get_query_translation,"\n"; #Tradução da querry de entrada

# Hits
print "Numero de Hits= ",$db->get_count,"\n\n"; #Imprime o numero de hits gerado

# IDs
my @ids = $db->get_ids; #salva ids no array

print "Termo usado para a pesquisa: ",$db->get_term, "\n"; #Imprime o termo que foi buscado

return @ids;
}

return 1;
