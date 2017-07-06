sub BaixaPDF #Baixa pdfs
{

	my @ids = @_;

	my $useragent = 'Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1';

	foreach $idpmc (@ids){
		my $pmcid = $idpmc;
		my $url =  "http://www.ncbi.nlm.nih.gov/pmc/articles/"."$idpmc"."/pdf/";
		my $arquivopdf = $idpmc."pdf";

		print "Baixando Arquivo: PMC$idpmc... \n";
		system "wget  --user-agent= '$useragent' -l1 --no-parent -A.pdf $url -O $arquivopdf 2>/dev/null";

	}

}

return 1;

