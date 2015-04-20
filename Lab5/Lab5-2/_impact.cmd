setMode -bs
setMode -bs
setMode -bs
setCable -port auto
Identify -inferir 
Identify -inferir 
identifyMPM 
assignFile -p 1 -file "D:/Lab/Lab5-2/bcd_30_down_counter.bit"
Program -p 1 
setMode -bs
setMode -bs
deleteDevice -position 1
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
