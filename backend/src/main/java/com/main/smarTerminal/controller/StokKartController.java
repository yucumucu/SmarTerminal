package com.main.smarTerminal.controller;

import com.main.smarTerminal.dto.barkod.SearchProductResponse;
import com.main.smarTerminal.entities.StokKart;
import com.main.smarTerminal.service.MarketSatisHareketService;
import com.main.smarTerminal.service.StokKartService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/stok-kartlar") // Base URL for the controller
@AllArgsConstructor
public class StokKartController {
    private final StokKartService stokKardService;
    private final MarketSatisHareketService marketSatisHareketService;

    @GetMapping
    public List<StokKart> getAllStokKarts() {
        return stokKardService.getAllStokKart();
    }

    @GetMapping("/{id}")
    public StokKart getStokKartById(@PathVariable Integer id) {
        return stokKardService.getStokKartById(id);
    }

    @GetMapping("/get/by-name")
    public List<SearchProductResponse> getStokKartByName(@RequestParam String name)
    {
        return  stokKardService.getListOfStokKartByName(name);
    }

    @PostMapping
    public StokKart createStokKart(@RequestBody StokKart stokKart) {
        return stokKardService.saveStokKart(stokKart);
    }

    @PutMapping("/{id}")
    public StokKart updateStokKart(@PathVariable Integer id, @RequestBody StokKart updatedStokKart) {
        return stokKardService.updateStokKart(id, updatedStokKart);
    }

    @GetMapping("/{id}/monthly")
    public List<Integer> getMonthlySalesById(@PathVariable Long id,@RequestParam String date) {
            return marketSatisHareketService.getMonthlySaleGraph(id,date);
    }

    @GetMapping("/{id}/yearly")
    public List<Integer> getMonthlyYearlyById(@PathVariable Long id,@RequestParam String date) {
        return marketSatisHareketService.getYearlySaleGraph(id,date);
    }

    @DeleteMapping("/{id}")
    public void deleteStokKart(@PathVariable Integer id) {
        stokKardService.deleteById(id);
    }
}
