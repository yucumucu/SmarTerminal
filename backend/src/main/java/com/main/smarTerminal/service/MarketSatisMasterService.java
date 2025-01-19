package com.main.smarTerminal.service;

import com.main.smarTerminal.entities.MarketSatisMaster;
import com.main.smarTerminal.repository.MarketSatisMasterRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class MarketSatisMasterService {
    private final MarketSatisMasterRepository marketSatisMasterRepository;

    public List<MarketSatisMaster> getByID(int id) {
        return marketSatisMasterRepository.findAllByMarketVardiyaID(id);
    }
}
