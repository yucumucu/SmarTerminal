package com.main.smarTerminal.controller;

import com.main.smarTerminal.dto.barkod.BarkodCreateRequestDTO;
import com.main.smarTerminal.dto.barkod.SearchProductResponse;
import com.main.smarTerminal.entities.Barkod;
import com.main.smarTerminal.entities.StokKart;
import com.main.smarTerminal.service.BarkodService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/barkodlar") // Base URL for the controller
@AllArgsConstructor
public class BarkodController {
    private final BarkodService barkodService;

    @GetMapping
    public List<Barkod> getAllBarkods() {
        return barkodService.findAll();
    }

    @GetMapping("/{id}")
    public Barkod getBarkodById(@PathVariable Long id) {
        return barkodService.findById(id);
    }

    @GetMapping("/getByBarkodNo")
    public SearchProductResponse getBarkodByBarkodNo(@RequestParam String barkodNo) {
        return  barkodService.getBarkodByBarkodNo(barkodNo);
    }

    @PostMapping("")
    public Barkod createBarkod(@RequestBody BarkodCreateRequestDTO barkod) {
        return barkodService.save(barkod);
    }

    @PutMapping("/{id}")
    public Barkod updateBarkod(@RequestBody Barkod updatedBarkod) {
        return barkodService.update(updatedBarkod);
    }

    @DeleteMapping("/{id}")
    public void deleteBarkod(@PathVariable Long id) {
        barkodService.delete(id);
    }

    // New Mapping to get the associated StokKart by Barkod ID
    @GetMapping("/{id}/stok-kart")
    public StokKart getStokKartByBarkodId(@PathVariable Long id) {
        return barkodService.findProductById(id);
    }

    // New Mapping to update the price of the associated StokKart by Barkod ID
    @PutMapping("/{id}/stok-kart/fiyat")
    public StokKart updateStokKartPrice(@PathVariable Long id, @RequestParam double newPrice) {
        return barkodService.updateProductById(id, newPrice);
    }
}
