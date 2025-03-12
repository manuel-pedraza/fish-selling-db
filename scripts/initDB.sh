#! /bin/bash
dir=docker-entrypoint-initdb.d/
data=${dir}data.sql
touch $data;
cat ${dir}FishSellingDB.sql > $data;
echo "USE [FishSellingDB]" >> $data;
echo "GO" >> $data;
cat ${dir}tables/Species.sql >> $data;
cat ${dir}tables/WaterBodyTypes.sql >> $data;
cat ${dir}tables/Contacts.sql >> $data;
cat ${dir}tables/Addresses.sql >> $data;
echo "GO" >> $data;
cat ${dir}tables/Fishermen.sql >> $data;
cat ${dir}tables/Customers.sql >> $data;
cat ${dir}tables/WaterBodies.sql >> $data;
cat ${dir}tables/Fish.sql >> $data;
echo "GO" >> $data;
cat ${dir}tables/Catches.sql >> $data;
cat ${dir}tables/Orders.sql >> $data;
cat ${dir}tables/Habitats.sql >> $data;
cat ${dir}tables/Locations.sql >> $data;
echo "GO" >> $data;
cat ${dir}tables/FishCatch.sql >> $data;
echo "GO" >> $data;
cat ${dir}tables/FishOrder.sql >> $data;
echo "GO" >> $data;
/opt/mssql-tools18/bin/sqlcmd -S sqlserver -U sa -P stR0ng#Th7ngY -C -d master -i $data;