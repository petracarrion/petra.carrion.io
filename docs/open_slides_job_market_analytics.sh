
cd /Users/carrion/PycharmProjects/petra.carrion.io/docs/job-market-analytics/slides || exit

lps=( 8001 8002 8003 8004 8005 )
lp=null

# find a free listening port
# shellcheck disable=SC2068
for port in ${lps[@]}; do
  lsof -i -n -P |grep LISTEN |grep -q ":${port}"
  [ $? -eq 1 ] && { lp=$port; break; }
done
[ "$lp" = "null" ] && { echo "no free local ports available"; return 2; }
echo $port

echo "Go to http://localhost:$port and press the key 'f'"
python3 -m http.server $port
