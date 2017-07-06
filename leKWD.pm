
sub estatisticaKWD {
	my $arquivo = "keywords.txt";
	open(fh, '<', $arquivo)
	or die "Nao foi possivel abrir o arquivo '$filename' $!";

	my @array;

	while (<fh>) {
	chomp $_; #Se tirar isso fica tudo desorganizado, mas não sei pq =(
	push (@array, $_);
}

	my %contador; #Cria array

	foreach my $str (@array) {
	$contador{$str}++;
	}

	foreach my $str (sort keys %contador) {
	printf "%-31s %s\n", $str, $contador{$str};
	}

}

return 1;


