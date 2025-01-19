package com.main.smarTerminal.dto.barkod;

import java.time.Instant;
import java.util.UUID;

public record BarkodCreateRequestDTO(
//        Long firmaID,
//        Long stokTipID,
        String kod,
        String barkodNo,
        UUID yaratanKullaniciID,
        Instant yaratilmaTarih,
        Boolean sil,
        Integer stokKartID
) {}