for i in $(seq 1 100); do 
    for sleep_s in 1.0 5.0 10.0; do
    for size_mb in 0.1 1.0 5.0 10.0 100.0; do
        echo -e '\n\033[31m===\033[0m'

        echo "date: $(date)" 
        echo "sleep_s: $sleep_s" 
        echo "size_mb: $size_mb" 

        echo -n "curlout: "
        curl -m 25 --connect-timeout 25 -X GET cdcicn01.isdc.unige.ch:5022/$size_mb/$sleep_s -o z 

        echo "curlexit: $?" 
        echo "host: $(hostname)" 

    done
    done
done
