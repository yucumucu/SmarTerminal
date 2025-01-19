package com.main.smarTerminal.service;

import com.main.smarTerminal.dto.MarketVardiyaMaster.TableInfoDTO;
import com.main.smarTerminal.entities.MarketSatisHareket;
import com.main.smarTerminal.repository.MarketSatisHareketRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;

@Service
@AllArgsConstructor
public class MarketSatisHareketService {

    private final MarketSatisHareketRepository marketSatisHareketRepository;


    public List<MarketSatisHareket> getTodaysSales() {

        ZoneId utcZone = ZoneId.of("UTC");
        //test date
        LocalDate testDate = LocalDate.of(2024, 11, 16);

        Instant startOfDay = testDate.atStartOfDay(utcZone).toInstant();
        Instant endOfDay = testDate.plusDays(1).atStartOfDay(utcZone).toInstant();

        return marketSatisHareketRepository.findAllByDate(startOfDay, endOfDay);
    }

    public List<MarketSatisHareket> getThisMonthSSales() {
        LocalDate today = LocalDate.now();

        ZoneId utcZone = ZoneId.of("UTC");

        Instant startOfDay = today.minusDays(30).atStartOfDay(utcZone).toInstant();
        Instant endOfDay = today.atStartOfDay(utcZone).toInstant();




        return marketSatisHareketRepository.findAllByDate(startOfDay, endOfDay);
    }

    public Integer getTotalMonthlySalesForId(Long id) {
        int sum = 0;
        LocalDate today = LocalDate.of(2024, 11, 20);

        ZoneId utcZone = ZoneId.of("UTC");

        Instant startOfDay = today.minusDays(30).atStartOfDay(utcZone).toInstant();
        Instant endOfDay = today.atStartOfDay(utcZone).toInstant();




        List<MarketSatisHareket> list = marketSatisHareketRepository.findAllByDateAndId(startOfDay, endOfDay,id);
        for (MarketSatisHareket marketSatisHareket : list) {
            sum+=marketSatisHareket.getMiktar().intValue();
        }
        return sum;
    }

    public List<Integer> getYearlySaleGraph(Long id,String date){
        int sum;
        List<Integer> result = new ArrayList<>();
        //LocalDate today = LocalDate.now();
        LocalDate today = LocalDate.parse(date);
        List<MarketSatisHareket> list;
        ZoneId utcZone = ZoneId.of("UTC");

        Instant startOfDay = today.atStartOfDay(utcZone).toInstant();
        Instant endOfDay;


        for(int i =1; i<=12;i++){
            sum= 0;
            endOfDay = startOfDay;
            startOfDay = today.minusDays(30*i).atStartOfDay(utcZone).toInstant();
            list = marketSatisHareketRepository.findAllByDateAndId(startOfDay, endOfDay,id);
            for (MarketSatisHareket marketSatisHareket : list) {
                sum+=marketSatisHareket.getMiktar().intValue();
            }
            result.add(sum);
        }
        Collections.reverse(result);
        return result;
    }

    public List<Integer> getMonthlySaleGraph(Long id,String date){
        int sum;
        List<Integer> result = new ArrayList<>();
        //test date
        LocalDate today = LocalDate.parse(date);
        //LocalDate today = LocalDate.now();
        List<MarketSatisHareket> list;
        ZoneId utcZone = ZoneId.of("UTC");

        Instant startOfDay = today.atStartOfDay(utcZone).toInstant();
        Instant endOfDay;


        for(int i =1; i<=30;i++){
            sum= 0;
            endOfDay = startOfDay;
            startOfDay = today.minusDays(i).atStartOfDay(utcZone).toInstant();
            list = marketSatisHareketRepository.findAllByDateAndId(startOfDay, endOfDay,id);
            for (MarketSatisHareket marketSatisHareket : list) {
                sum+=marketSatisHareket.getMiktar().intValue();
            }
            result.add(sum);
        }
        Collections.reverse(result);
        return result;
    }

    public Map<String, Integer> getGroupTotal(List<MarketSatisHareket> Sales) {

        Map<String, Integer> groupIdCounts = new HashMap<>();
        List<TableInfoDTO> tableInfoDTOs = new ArrayList<>();
        for (MarketSatisHareket sale : Sales) {

            String groupName = sale.getStokKart().getGrup().getAd();


            groupIdCounts.put(groupName, groupIdCounts.getOrDefault(groupName, 0) + sale.getMiktar().intValue());
        }

        for(String s : groupIdCounts.keySet()) {
            tableInfoDTOs.add(new TableInfoDTO(s,groupIdCounts.get(s)));
        }

        return groupIdCounts;
    }

    public Map<String, Integer> getSaleTotal(List<MarketSatisHareket> Sales) {

        Map<String, Integer> groupIdCounts = new HashMap<>();
        List<TableInfoDTO> tableInfoDTOs = new ArrayList<>();
        for (MarketSatisHareket sale : Sales) {

            String itemName = sale.getStokKart().getAd();


            groupIdCounts.put(itemName, groupIdCounts.getOrDefault(itemName, 0) + sale.getMiktar().intValue());
        }
        for(String s : groupIdCounts.keySet()) {
            tableInfoDTOs.add(new TableInfoDTO(s,groupIdCounts.get(s)));
        }

        return groupIdCounts;
    }

    public List<MarketSatisHareket> getTotalSales(int marketVardiyaID) {
        return marketSatisHareketRepository.findAllByMarketVardiyaID(marketVardiyaID);
    }

}
