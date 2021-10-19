SEASON=2021
WELCOME_MESSAGE="IPL TROPHY"
MATCHES_PLAYED=14
win=0
lose=0
nrr=""
position=0
totalPoints=0
points=2


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




function checkEligibility()
{
    actualposition=$1
  if [[ $((0 < actualposition && 4> actualposition)) ]]
  then
echo "Team Eligible for Play off"
else
echo "Team is not Eligible for Play off"
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
        checkEligibility $1
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