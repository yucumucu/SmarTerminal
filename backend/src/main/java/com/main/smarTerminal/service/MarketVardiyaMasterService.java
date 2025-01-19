package com.main.smarTerminal.service;

import com.main.smarTerminal.dto.MarketVardiyaMaster.MarketVardiyaMasterDetailedDTO;
import com.main.smarTerminal.dto.MarketVardiyaMaster.MarketVardiyaMasterSummaryDTO;
import com.main.smarTerminal.entities.MarketSatisHareket;
import com.main.smarTerminal.entities.MarketVardiyaMaster;
import com.main.smarTerminal.repository.MarketVardiyaMasterRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

@Service
@AllArgsConstructor
public class MarketVardiyaMasterService {

    private final MarketVardiyaMasterRepository marketVardiyaMasterRepository;
    private final MarketSatisHareketService marketSatisHareketService;
    private final MarketSatisMasterService marketSatisMasterService;


    public List<MarketVardiyaMaster> findAll() {
        return marketVardiyaMasterRepository.findAll();
    }

    public MarketVardiyaMaster getMarketVardiyaMasterbyId(Integer id) {
        return marketVardiyaMasterRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("Employee was not Found."));
    }

    public List<MarketVardiyaMasterSummaryDTO> getVardiyaSummaries(){
        //test date
        LocalDate today = LocalDate.of(2024, 11, 20);

        ZoneId utcZone = ZoneId.of("UTC");

        Instant startOfDay = today.minusDays(30).atStartOfDay(utcZone).toInstant();
        Instant endOfDay = today.atStartOfDay(utcZone).toInstant();
        return marketVardiyaMasterRepository.findAllByDate(startOfDay,endOfDay)
                .stream()
                .map(i -> new MarketVardiyaMasterSummaryDTO(i.getId().toString(),i.getDate(),i.getTimeInterval(),i.getPersonelKartID().getAd(),
                        i.getPersonelKartID().getSoyad(),i.getSatisToplam(),i.farkHesapla()))
                .toList();
    }

    public MarketVardiyaMasterDetailedDTO getVardiyaDetails(Integer id) {
        MarketVardiyaMaster m = getMarketVardiyaMasterbyId(id);
        int kisiSayisi = marketSatisMasterService.getByID(id).size();
        return new MarketVardiyaMasterDetailedDTO(m.getIadeToplam(),m.getVeresiyeToplam(),m.getPosToplam(),
                m.getNaktestop(),m.getGiderToplam(),m.getGelirToplam(),kisiSayisi);
    }

    public Map<String, Integer> getShiftSales(Integer id){
       List<MarketSatisHareket> marketSatisHareketList = marketSatisHareketService.getTotalSales(id);
       return marketSatisHareketService.getSaleTotal(marketSatisHareketList);
    }

}
