{
    if (NR==6) print "Compte:", $0, "\n\nPayable à:"
    if (NR>=8 && NR<=13) print
    if (NR==13) print "\n\nBénéficiaire final:"
    if (NR>=14 && NR<=20) print
    if (NR==21) print "Montant:", $0
    if (NR==22) print "Monnaie:", $0, "\n\nPayable par:"
    if (NR>=24 && NR<=29) print
    if (NR==31) print "\nRéférence:", $0
    if (NR==32) print "\nInformations supplémentaires:", $0
}
