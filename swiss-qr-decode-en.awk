{
    if (NR==6) print "Account:", $0, "\n\nPayable to:"
    if (NR>=8 && NR<=13) print
    if (NR==13) print "\n\nFinal payee:"
    if (NR>=14 && NR<=20) print
    if (NR==21) print "Amount:  ", $0
    if (NR==22) print "Currency:", $0, "\n\nPayable by:"
    if (NR>=24 && NR<=29) print
    if (NR==31) print "\nReference:", $0
    if (NR==32) print "\nAdditional information:", $0
}
