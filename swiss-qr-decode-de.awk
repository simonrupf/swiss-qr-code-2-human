{
    if (NR==6) print "Konto:", $0, "\n\nZahlbar an:"
    if (NR>=8 && NR<=13) print
    if (NR==13) print "\n\nEndgültiger Zahlungsempfänger:"
    if (NR>=14 && NR<=20) print
    if (NR==21) print "Betrag: ", $0
    if (NR==22) print "Währung:", $0, "\n\nZahlbar durch:"
    if (NR>=24 && NR<=29) print
    if (NR==31) print "\nReferenz:", $0
    if (NR==32) print "\nZusätzliche Informationen:", $0
}
