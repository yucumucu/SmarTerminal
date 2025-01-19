package com.main.smarTerminal.service;

import com.main.smarTerminal.dto.barkod.BarkodCreateRequestDTO;
import com.main.smarTerminal.dto.barkod.SearchProductResponse;
import com.main.smarTerminal.entities.Barkod;
import com.main.smarTerminal.entities.StokKart;
import com.main.smarTerminal.repository.BarkodRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;

@Service
@AllArgsConstructor
public class BarkodService {
    private final BarkodRepository barkodRepository;
    private final StokKartService stokKartService;
    private final MarketSatisHareketService marketSatisHareketService;

    public List<Barkod> findAll() {
        return barkodRepository.findAll();
    }

    public Barkod findById(Long id) {
        return barkodRepository.findById(id).orElseThrow(()-> new NoSuchElementException("Barkod not found"));
    }

    public StokKart findProductById(Long id){
        Barkod barkod = this.findById(id);
        return barkod.getStokKart();
    }

    public SearchProductResponse getBarkodByBarkodNo(String barkodNo)
    {
        Barkod barkod = barkodRepository.findBarkodsByBarkodNo(barkodNo)
                .orElseThrow( () -> new NoSuchElementException("Barkod not found with barkodNo: " + barkodNo));
        StokKart stokKart = barkod.getStokKart();
        Double amount = stokKart.getAlisMiktar() +  stokKart.getAcilisMiktar() - stokKart.getSatisMiktar();
        Integer monthlySale = marketSatisHareketService.getTotalMonthlySalesForId(stokKart.getId());
        return new SearchProductResponse(stokKart.getAd()
                , stokKart.getAlisFiyat()
                ,stokKart.getSatis1Fiyat()
                ,stokKart.getGrup().getAd()
                ,amount
                ,monthlySale);
    }

    public StokKart updateProductById(Long id, double newPrice){
        Barkod barkod = this.findById(id);
        StokKart stokKart = barkod.getStokKart();
        stokKart.setSatis1Fiyat(newPrice);
        stokKartService.saveStokKart(stokKart);
        return stokKart;
    }

    public Barkod save(BarkodCreateRequestDTO dto) {

        StokKart stokKart = stokKartService.getStokKartById(dto.stokKartID());

        Barkod barkod = Barkod.builder()
                .kod(dto.kod())
                .barkodNo(dto.barkodNo())
                .yaratilmaTarih(dto.yaratilmaTarih())
                .sil(dto.sil())
                .stokKart(stokKart)
                .yaratanKullaniciID(dto.yaratanKullaniciID())
                .build();
        return barkodRepository.save(barkod);
    }

    public Barkod update(Barkod updatedStokKart) {
        Barkod existingBarkod = barkodRepository.findById(updatedStokKart.getId()).orElseThrow(()-> new NoSuchElementException("Barkod not found"));

        existingBarkod.setBarkodNo(updatedStokKart.getBarkodNo());
        existingBarkod.setKod( updatedStokKart.getKod());
        existingBarkod.setFirmaID(updatedStokKart.getFirmaID());
        // Update other fields as necessary

        return barkodRepository.save(existingBarkod);
    }

    public void delete(Long id) {
        Barkod barkodToDelete = findById(id);
        barkodRepository.delete(barkodToDelete);
    }
}
