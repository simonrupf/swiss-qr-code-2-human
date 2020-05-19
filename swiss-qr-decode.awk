{
    if (NR==4) print "Konto:    ", $0, "\n\nZahlungsempfänger:"
    if (NR>=6 && NR<=11) print
    if (NR==11) print "\n\nEndgültiger Zahlungsempfänger:"
    if (NR>=12 && NR<=18) print
    if (NR==19) print "Betrag:  ", $0
    if (NR==20) print "Währung: ", $0, "\n\nZahlungspflichtiger:"
    if (NR>=22 && NR<=27) print
    if (NR==29) print "\nReferenz:", $0
}
