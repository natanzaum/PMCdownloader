#!/usr/bin/perl

#use strict;
#use warnings;
use Bio::DB::EUtilities;
use Getopt::Long;
require "./query.pm";
require "./baixapdf.pm";
require "./buscaKWD.pm";
require "./leKWD.pm";

GetOptions(
	't=s'    => \@termo,
	'e=s'     => \$email,
	'n=i' => \$n,
	'f=s' => \$arquivo,
	'help'     => \$help,
) or die "Uso Incorreto!\nDigite Perl PMCdownload -help para obter ajuda!\n\n"; #Trata alguns erros


if ($help){ #Ajuda
	print "HELP!\nUso => Digite Perl PMCdownload -t 'Termo a ser pesquisado, entre aspas duplas' -e 'E-mail' -n 'Numero de artigos' -f 'Nome do arquivo de saida' \n\n";
	die;
}

#----------Trata todos os erros de entrada invalida---------------
if (!@termo){ 

	print "\nERRO!!\nVoce deve inserir um termo para a pesquisa.\nDigite perl PMCdownload -help para obter ajuda.\n\n";
	exit;
};

if (!$email){

	print "\nERRO!!\nVoce deve inserir um email valido para poder efetuar a pesquisa.\nDigite perl PMCdownload -help para obter ajuda.\n\n";
	exit;
};

if(!$n) {

	print "ERRO!!\nVoce deve inserir o numero de artigos para download.\nDigite perl PMCdownload -help para obter ajuda.\n\n";
	exit;
};
#
#-------- abre arquivo -------------
open (ARQUIVO, '>', $arquivo);

print "\n----------------INFORMACOES DA PESQUISA------------\n";
@ids = queryPMC('$termo',$email,$n);

print "\n----------------ARTIGOS ENCONTRADOS----------------\n";

#imprime ids
foreach (@ids) {
	print "PMC$_\n";
}

#grava ids no arquivo
foreach (@ids){
	print ARQUIVO  "PMC$_\n";
}

print "\n-------------------BAIXANDO PDF's-----------------\n";
BaixaPDF(@ids);

print "\n-------------ESTATISTICAS (KEYWORDS)---------------\n";
print "\nObtendo estatisticas, aguarde...\n";
infoKWD(@ids);
print "\n::::::Keyword - Repeticoes::::::\n";
estatisticaKWD();
