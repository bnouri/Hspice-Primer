
***Options:
.OPTION PROBE
.OPTION POST=1			$POST=1 is for Hspice-toolbox
.OPTION LIST=0
.OPTION INGOLD=2


***For tran. sim:
.OPTION ACCURATE
.OPTION DVDT=2
.OPTION LVLTIM=2
.OPTION TRTOL=10
*.OPTION RMIN=1.0e-10

*.OPTION INTERP=1


***For Selecting Integration Method:
*.OPTION RUNLVL=5
*.OPTION METHOD=TRAP PURETP
*.option method=gear maxord=1
*.option method=gear
*.option method=bdf
