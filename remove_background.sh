clear; printf "Running!\n"

printf "> Cloning repo\n"
git clone --quiet -b pull-model-weights-during-build https://github.com/nwautomator/rembg-webapp-tutorial

printf "> Entering repo directory\n"
cd rembg-webapp-tutorial

printf "> Building docker image.  This will take a while...\n"

docker build -t removebg -f Dockerfile . --quiet & PID=$!

# Cute little spinner time!
SPINNER=('⠋' '⠇' '⡆' '⣄' '⣠' '⢰' '⠸' '⠙')
let SPINNER_LOC=0

while kill -0 $PID 2> /dev/null; do 
	
	echo -ne "\b\b${SPINNER[SPINNER_LOC]} ";

	let SPINNER_LOC+=1;

	if [ "${#SPINNER[@]}" -eq "${SPINNER_LOC}" ]; then
		SPINNER_LOC=0
	fi

	sleep 0.1
done


printf "> Leaving repo directory\n"
cd ..

printf "\nRun $(tput setaf 13) docker run --rm -it --name remove-bg removebg $(tput sgr0) to run the image"
