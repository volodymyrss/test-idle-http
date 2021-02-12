for i in $(seq 1 100); do 
    for sleep_s in 1.0 5.0 10.0; do
    for size_mb in 0.1 1.0 5.0 10.0 100.0; do
        echo -e '\n\033[31m===\033[0m'

        set -x

        jq -n \
            --arg date "$(date)" \
            --arg curlout "$(curl -m 25 --connect-timeout 25 -X GET cdcicn01.isdc.unige.ch:5022/$size_mb/$sleep_s -o z 2>&1)" \
            --arg exitcode "$?" \
            --arg host "$(hostname)" \
            --arg sleep_s "$sleep_s" \
            --arg size_mb "$size_mb" \
            '{origin: "testhttpidle", size_mb: $size_mb, sleep_s: $sleep_s, host: $host, date: $date, curlout: $curlout, exited: $exitcode}' > log-1

        cat log-1 | nc cdcicn01.isdc.unige.ch 5001

        < log-1 jq
        cat log-1 >> log-combined

    done
    done
done
