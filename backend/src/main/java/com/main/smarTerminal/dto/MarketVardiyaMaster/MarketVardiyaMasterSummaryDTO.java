package com.main.smarTerminal.dto.MarketVardiyaMaster;

import java.time.Instant;

public record MarketVardiyaMasterSummaryDTO(
    String id,
    String tarih,
    String saat,
    String ad,
    String soyad,
    Double satisToplam,
    Double fark
) {
}
