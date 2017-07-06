use Bio::DB::EUtilities;
use Data::Dumper;
use XML::LibXML;

sub infoKWD{


	my @ids = @_;

	open (ARQUIVO, '>:encoding(UTF-8)', "keywords.txt");

	my $db = Bio::DB::EUtilities->new(-eutil => 'efetch',
		-email => 'natanpedersolli@gmail.com',
		-db => 'pmc',
		-rettype =>'medline',
		-retmode => 'xml',
		-id => \@ids);

	my $conteudo = $db->get_Response->content;

	my $dom = XML::LibXML->load_xml(string => $conteudo);

#print $dom
#print $dom;

foreach my $kwd ($dom->findnodes('//kwd-group/kwd')) {
	chomp $kdw;
	print ARQUIVO $kwd->to_literal()."\n";
}

close (ARQUIVO);

}

return 1;



