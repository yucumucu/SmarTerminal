package com.main.smarTerminal.repository;

import com.main.smarTerminal.entities.MarketSatisHareket;
import com.main.smarTerminal.entities.MarketSatisMaster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.util.List;

public interface MarketSatisMasterRepository extends JpaRepository<MarketSatisMaster, BigDecimal> {

    @Query("SELECT m FROM MarketSatisMaster m WHERE m.marketVardiyaID = :marketVardiyaID")
    List<MarketSatisMaster> findAllByMarketVardiyaID(@Param("marketVardiyaID") int marketVardiyaID);
}
