while true; do    
    sleep_s=$((RANDOM%20+1))
    size_mb=$((RANDOM%20+1))

    echo -e '\n\033[31m===\033[0m'

    echo "date: $(date)" 
    echo "sleep_s: $sleep_s" 
    echo "size_mb: $size_mb" 

    echo -n "curlout: "
    curl -m 25 --connect-timeout 25 -X GET cdcicn01.isdc.unige.ch:5022/$size_mb/$sleep_s -o z 

    echo "curlexit: $?" 
    echo "host: $(hostname)" 

    sleep 1;
done
