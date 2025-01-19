package com.main.smarTerminal.controller;

import com.main.smarTerminal.dto.MarketVardiyaMaster.MarketVardiyaMasterDetailedDTO;
import com.main.smarTerminal.dto.MarketVardiyaMaster.MarketVardiyaMasterSummaryDTO;
import com.main.smarTerminal.dto.MarketVardiyaMaster.TableInfoDTO;
import com.main.smarTerminal.entities.MarketVardiyaMaster;
import com.main.smarTerminal.service.MarketVardiyaMasterService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api/shifts")
@AllArgsConstructor
public class MarketVardiyaMasterController {
    private final MarketVardiyaMasterService  marketVardiyaMasterService;



    @GetMapping
    public List<MarketVardiyaMaster> getAllShifts() {
        return marketVardiyaMasterService.findAll();
    }

    @GetMapping("/{id}")
    public MarketVardiyaMaster getShiftById(@PathVariable Integer id) {
        return marketVardiyaMasterService.getMarketVardiyaMasterbyId(id);
    }

    @GetMapping("/summaries")
    public List<MarketVardiyaMasterSummaryDTO> getSummaries(){
        return marketVardiyaMasterService.getVardiyaSummaries();
    }

    @GetMapping("/{id}/details")
    public MarketVardiyaMasterDetailedDTO getShiftDetails(@PathVariable Integer id){
        return marketVardiyaMasterService.getVardiyaDetails(id);
    }

    @GetMapping("/{id}/sales")
    public Map<String, Integer> getShiftSales(@PathVariable Integer id){
        return marketVardiyaMasterService.getShiftSales(id);
    }
}
