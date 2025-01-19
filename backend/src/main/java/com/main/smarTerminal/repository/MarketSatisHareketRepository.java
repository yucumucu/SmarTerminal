package com.main.smarTerminal.repository;

import com.main.smarTerminal.entities.MarketSatisHareket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

@Repository
public interface MarketSatisHareketRepository extends JpaRepository<MarketSatisHareket, BigDecimal> {

    @Query("SELECT m FROM MarketSatisHareket m WHERE m.tarih BETWEEN :startOfDay AND :endOfDay")
    List<MarketSatisHareket> findAllByDate(@Param("startOfDay") Instant startOfDay, @Param("endOfDay") Instant endOfDay);

    @Query("SELECT m FROM MarketSatisHareket m WHERE m.marketVardiyaID = :marketVardiyaID")
    List<MarketSatisHareket> findAllByMarketVardiyaID(@Param("marketVardiyaID") int marketVardiyaID);

    @Query("SELECT m FROM MarketSatisHareket m WHERE m.tarih BETWEEN :startOfDay AND :endOfDay AND m.stokKart.id = :stokKartId")
    List<MarketSatisHareket> findAllByDateAndId(@Param("startOfDay") Instant startOfDay,
                                                @Param("endOfDay") Instant endOfDay,
                                                @Param("stokKartId") Long stokKartId);

}
