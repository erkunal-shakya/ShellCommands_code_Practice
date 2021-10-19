declare -A rcbTeam
SEASON=2021
WELCOME_MESSAGE="IPL TROPHY"
MATCHES_PLAYED=14
win=0
lose=0
nrr=""
position=0
totalPoints=0
points=2
cskTeam=("Dhoni" "Moenali" "Jadeja")
miTeam=("Rohit" "Hardik" "Ishan" "raina" "sehwag")
rcbTeam[captain]="Kholi"
rcbTeam[batsman]="Abd"
rcbTeam[bowler]="Siraj"
echo "Welcome $WELCOME_MESSAGE !!! $SEASON"
echo "Please Enter Your Favourite Team"
echo "Eg:- Type RCB Instead of Royal Challengers Of Bangalore"
read teamName
convertingToLowerCase=`echo "$teamName" | awk '{print tolower($0)}'`


function error() {
         echo "Something Went Wrong ..."
}


if [ $convertingToLowerCase == "dc" ]
then
    position=1
elif [ $convertingToLowerCase == "csk" ]
then
    position=2
elif [ $convertingToLowerCase == "rcb" ]
then
    position=3
elif [ $convertingToLowerCase == "kkr" ]
then
    position=4
elif [ $convertingToLowerCase == "mi" ]
then
    position=5
elif [ $convertingToLowerCase == "pbks" ]
then
    position=6
elif [ $convertingToLowerCase == "rr" ]
then
    position=7
elif [ $convertingToLowerCase == "srh" ]
then
    position=8
else
    error
fi


function playoffs() {


         nameOfTeam=`echo "$2" | awk '{print toupper($0)}'`
         if (( $1 > 0 && $1 <= 4 ))
         then
             echo "$nameOfTeam Is Elgible For PlayOffs"
         else
             echo "$nameOfTeam Is not Eligible For PlayOffs"
         fi


}


function captain() {
         echo "$1 Is Captain Of $2"
}


function batsman() {
         echo "$1 Is Batsman Of $2"
}


function bowler() {
         echo "$1 Is Bowler Of $2"
}

function wicketkipper() {
         echo "$1 Is wicketkipper Of $2"
}

function allrounder() {
         echo "$1 Is allrounder Of $2"
}


function rolesAndResponsibility() {
         teamNameConversion=`echo "$teamName" | awk '{print tolower($0)}'`
         if [ $teamNameConversion == "csk" ]
         then
                   for team in ${cskTeam[*]}
                   do
                   playerName=`echo "$team" | awk '{print tolower($0)}'`
                   if [ $playerName == "dhoni" ]
                   then
                        captain $team $teamNameConversion
                   elif [ $playerName == "moenali" ]
                   then
                        batsman $team $teamNameConversion
                    elif [ $playerName == "moenali" ]
                   then
                        wicketkipper $team $teamNameConversion
                    elif [ $playerName == "moenali" ]
                   then
                        allrounder $team $teamNameConversion
                   else
                        bowler $team $teamNameConversion
                   fi
                   done
         elif [ $teamNameConversion == "rcb" ]
         then
                   for team in ${rcbTeam[*]}
                   do
                   playerName=`echo "$team" | awk '{print tolower($0)}'`
                   if [ $playerName == "kholi" ]
                   then
                        captain $team $teamNameConversion
                   elif [ $playerName == "abd" ]
                   then
                        batsman $team $teamNameConversion
                   else
                        bowler $team $teamNameConversion
                   fi
                   done

         elif [ $teamNameConversion == "mi" ]
         then
                   for team in ${miTeam[*]}
                   do
                   playerName=`echo "$team" | awk '{print tolower($0)}'`
                   if [ $playerName == "rohit" ]
                   then
                        captain $team $teamNameConversion
                   elif [ $playerName == "raina" ]
                   then
                        batsman $team $teamNameConversion
                    elif [ $playerName == "sehwag" ]
                   then
                        wicketkipper $team $teamNameConversion
                    elif [ $playerName == "hardik" ]
                   then
                        allrounder $team $teamNameConversion
                   else
                        bowler $team $teamNameConversion
                   fi
                   done
         fi


       


}


function calculatorOfPointsTable() {
         lose=$((MATCHES_PLAYED-$2))
         totalPoints=$(($2*$points))
         echo "Your Favourite Team Secured $1 Place :)"
         echo "Matches Faced : $MATCHES_PLAYED"
         echo "Won : $2 ******* Lost : $lose"
         echo "Run Rate : $3"
         echo "Points Scored : $totalPoints"
         playoffs $1 $teamName
         rolesAndResponsibility
}




case $position in
   1)
      win=10
      nrr="+0.481"
      calculatorOfPointsTable $position $win $nrr
      ;;
   2)
      win=9
      nrr="+0.455"
      calculatorOfPointsTable $position $win $nrr
      ;;
   3)
      win=9
      nrr="-0.140"
      calculatorOfPointsTable $position $win $nrr
      ;;
   4)
      win=7
      nrr="+0.587"
      calculatorOfPointsTable $position $win $nrr
      ;;
   5)
      win=7
      nrr="+0.116"
      calculatorOfPointsTable $position $win $nrr
      ;;
   6)
      win=6
      nrr="-0.001"
      calculatorOfPointsTable $position $win $nrr
      ;;
   7)
      win=5
      nrr="-0.993"
      calculatorOfPointsTable $position $win $nrr
      ;;
   8)
      win=3
      nrr="-0.545"
      calculatorOfPointsTable $position $win $nrr
      ;;
   *)
     
     ;;
esac