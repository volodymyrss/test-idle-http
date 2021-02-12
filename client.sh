while true; do    
    sleep_ms=$((RANDOM%12000+100))
    size_mb=$((RANDOM%20+1))

    echo -e '\n\033[31m===\033[0m'

    echo "date: $(date)" 
    echo "time: $(date +%s)" 
    echo "sleep_ms: $sleep_ms" 
    echo "size_mb: $size_mb" 

    echo -n "curlout: "
    curl -m 25 --connect-timeout 25 -X GET cdcicn01.isdc.unige.ch:5022/$size_mb/$sleep_ms -o z 

    echo "curlexit: $?" 
    echo "host: $(hostname)" 

    sleep 1;
done
