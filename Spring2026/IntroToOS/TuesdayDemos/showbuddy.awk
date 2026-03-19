BEGIN {
  system("cc -o fixedmalloc fixedmalloc.c")
  system("cc -o randmalloc randmalloc.c")
  system("./fixedmalloc &")
  system("./randmalloc &")
  for (i=1; i<=999; i++) {
    # system("clear")
    print "                    2^0=1p=4k ^1=2p=8k  4p     8p    16p    32p    64p   128p   256p   512p  1024p"
#Node 0, zone      DMA     68     64     39     37     34     16      1      1      1      0      0 
#Node 0, zone    DMA32    543    344   1391   1386    925    444    190     53      9      1      0 
    com = "cat /proc/buddyinfo"
    which = 1 - which
    n = 0
    while (com | getline) {
      ++n
      for (i=5; i<=NF; i++) sto[which,n,i] = $i
      print $0
      printf "%21s",""
      for (i=5; i<=NF; i++) {
        diff = sto[which,n,i] - sto[(1-which),n,i]
        if (diff) printf "%+7d",diff
        else printf "%7s",""
      }
      print ""
    }; close(com)
    system("ps")
    system("sleep 1")
  }
}
