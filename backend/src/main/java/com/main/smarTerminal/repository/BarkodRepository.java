package com.main.smarTerminal.repository;

import com.main.smarTerminal.entities.Barkod;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BarkodRepository extends JpaRepository<Barkod, Long> {
     Optional<Barkod> findBarkodsByBarkodNo(String barkodNo);
}
