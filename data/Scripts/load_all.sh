#!/bin/bash
# ./load_all.sh <path_voltdb> <path_data> <limitrows> <csv_tripdata_colour2016> <csv_tripdata_colour2017> <csv_taxi_zones>
# ./load_all.sh /home/alex/Escritorio/TFG/voltdb/voltdb /home/alex/Escritorio/TFG-taxis/data 10000 yellow_tripdata_2016-06.csv yellow_tripdata_2017-06.csv taxi-zone-lookup-with-ntacode.csv


#ejemplo de ejecución de alfonso
#./load_all.sh /home/anombela/Escritorio/TFG/voltdb/voltdb/ /home/anombela/Escritorio/TFG-taxis/data 10000 yellow_tripdata_2016-06.csv yellow_tripdata_2017-06.csv taxi-zone-lookup-with-ntacode.csv

javac -cp "$CLASSPATH:$1/*" $2/files/*.java
cd $2/files
jar cvf $2/files/storedprocs.jar *.class
echo -e "load classes $2/files/storedprocs.jar" | sqlcmd
echo -e "FILE $2/SQLs/taxis.sql" | sqlcmd
csvloader --skip 1 --file $2/../CSVs/$4 taxis2016 --limitrows $3
csvloader --skip 1 --file $2/../CSVs/$5 taxis2017 --limitrows $3
csvloader --skip 1 --file $2/../CSVs/$6 location --limitrows $3
