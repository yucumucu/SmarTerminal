package com.main.smarTerminal.controller;

import com.main.smarTerminal.entities.MarketSatisHareket;
import com.main.smarTerminal.service.MarketSatisHareketService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/MainMenuStats")
public class MarketSatisHareketController {

    private final MarketSatisHareketService marketSatisHareketService;

    @GetMapping("")
    public Map<String, Integer> getGroupIdCounts() {
        List<MarketSatisHareket> satislar = marketSatisHareketService.getTodaysSales();
        return marketSatisHareketService.getGroupTotal(satislar);
    }

}
