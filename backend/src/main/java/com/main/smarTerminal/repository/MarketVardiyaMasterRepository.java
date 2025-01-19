package com.main.smarTerminal.repository;


import com.main.smarTerminal.entities.MarketVardiyaMaster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.Instant;
import java.util.List;

public interface MarketVardiyaMasterRepository extends JpaRepository<MarketVardiyaMaster,Integer> {

    @Query("SELECT m FROM MarketVardiyaMaster m WHERE m.tarih BETWEEN :startOfDay AND :endOfDay")
    List<MarketVardiyaMaster> findAllByDate(@Param("startOfDay") Instant startOfDay, @Param("endOfDay") Instant endOfDay);
}
