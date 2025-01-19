package com.main.smarTerminal.repository;

import com.main.smarTerminal.entities.StokKart;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface StokKartRepository  extends JpaRepository<StokKart, Integer> {
    Optional<StokKart> findByAd(String ad);

    List<StokKart> findByAdContainingIgnoreCase(String name);
}
