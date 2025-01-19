package com.main.smarTerminal.service;

import com.main.smarTerminal.dto.barkod.SearchProductResponse;
import com.main.smarTerminal.entities.StokKart;
import com.main.smarTerminal.repository.StokKartRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
@AllArgsConstructor
public class StokKartService {
    private final StokKartRepository stokKartRepository;
    private final MarketSatisHareketService marketSatisHareketService;

    public List<StokKart> getAllStokKart() {
        return stokKartRepository.findAll();
    }

    public StokKart getStokKartById(Integer id) {
        return stokKartRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("StokKart is not Found."));
    }

    public SearchProductResponse getStokKartByName(String name) {
        Optional<StokKart> stokKartOptional = stokKartRepository.findByAd(name);
        if (stokKartOptional.isPresent())
        {
            StokKart stokKart = stokKartOptional.get();
            Double amount = stokKart.getAlisMiktar() +  stokKart.getAcilisMiktar() - stokKart.getSatisMiktar();
            Integer monthlySale = marketSatisHareketService.getTotalMonthlySalesForId(stokKart.getId());
            return new SearchProductResponse(
                    stokKart.getAd()
                    ,stokKart.getAlisFiyat()
                    ,stokKart.getSatis1Fiyat()
                    ,stokKart.getGrup().getAd()
                    ,amount
                    ,monthlySale
            );
        }
        else
            throw new NoSuchElementException("StokKart is not found with name: " + name);
    }

    public List<SearchProductResponse> getListOfStokKartByName(String name) {
        List<StokKart> stokKarts = stokKartRepository.findByAdContainingIgnoreCase(name);

        if (stokKarts.isEmpty()) {
            throw new NoSuchElementException("No StokKart found with name containing: " + name);
        }

        List<SearchProductResponse> responseList = new ArrayList<>();

        for (StokKart stokKart : stokKarts) {
            Double amount = stokKart.getAlisMiktar() + stokKart.getAcilisMiktar() - stokKart.getSatisMiktar();
            Integer monthlySale = marketSatisHareketService.getTotalMonthlySalesForId(stokKart.getId());

            responseList.add(new SearchProductResponse(
                    stokKart.getAd(),
                    stokKart.getAlisFiyat(),
                    stokKart.getSatis1Fiyat(),
                    stokKart.getGrup().getAd(),
                    amount,
                    monthlySale
            ));
        }

        return responseList;
    }


    public StokKart saveStokKart(StokKart stokKart) {
        return stokKartRepository.save(stokKart);
    }

    public StokKart updateStokKart(Integer id, StokKart updatedStokKart) {
        StokKart existingStokKart = stokKartRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("StokKart with ID " + id + " not found."));

        existingStokKart.setKod(updatedStokKart.getKod());
        existingStokKart.setAd(updatedStokKart.getAd());
        existingStokKart.setSatis1Fiyat(updatedStokKart.getSatis1Fiyat());
        // Update other fields as necessary

        return stokKartRepository.save(existingStokKart);
    }

    public void deleteById(Integer id) {
        stokKartRepository.deleteById(id);
    }
}
