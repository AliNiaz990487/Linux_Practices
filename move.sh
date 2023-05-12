
count=0
# get the total number of files and directories in a directory we 
# want to move ($1 is the source)
total=$(ls ${1} | wc -l)

# Extract the last directory name form the path
backupDir=$(basename ${1})
# Create directory with the extracted name in the destination 
# ($2 is the destination)
mkdir ${2}/${backupDir}

# loop through all the files in the source directory
for fname in $(ls ${1})
do
	
	#Show Progress Bar
	str="  ["
	for (( i=0; i<count; i++))
	do
		str=$str"="
	done
	((count++))
	for (( i=0; i<(total-count); i++))
	do
		str=$str" "
	done
	
	str=$str"] ($count/$total): $fname"
	printf "$str\r"
	
#The sleep is to just slow things down because I am copying a small file 
	sleep 1
	
#Mere aqal ko daad dain file ka name move.sh hai aur asal me karta copying hai 
	# copy the source files one by one and increament progress
	cp -r ${1}/$fname ${2}/$backupDir
	
#Clear the line after carriage return (\r) 
	for (( i=0; i<(${#str}); i++))
	do
		printf " "
	done
	printf "\r"
done