file_obj = open("cmain.asm")
try:
	list_of_all_the_lines = file_obj.readlines()
finally:
	file_obj.close()


f_obj2   = open("_cmain.asm",'w')

for line in list_of_all_the_lines:
	if ( not line.startswith('extern')) and (not line.startswith('SECTION')) and  (not line.startswith('global')):
		f_obj2.write(line)

f_obj2.close()
