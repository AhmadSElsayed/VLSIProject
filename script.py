tempelate = "Row1(! downto ?) & Row2(! downto ?) & Row3(! downto ?) & Row4(! downto ?) & Row5(! downto ?) when address = #"

list =[]
for i in range(0, 250):
	print(tempelate.replace("!",str(2047 -i * 8)).replace("?", str(2008 -i *8)).replace("#", str(i))
