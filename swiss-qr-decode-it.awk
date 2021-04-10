{
    if (NR==6) print "Conto:", $0, "\n\nPagabile a:"
    if (NR>=8 && NR<=13) print
    if (NR==13) print "\n\nBeneficiario finale:"
    if (NR>=14 && NR<=20) print
    if (NR==21) print "Quantità:", $0
    if (NR==22) print "Moneta:  ", $0, "\n\nPagabile da:"
    if (NR>=24 && NR<=29) print
    if (NR==31) print "\nRiferimento:", $0
    if (NR==32) print "\nInformazioni aggiuntive:", $0
}
